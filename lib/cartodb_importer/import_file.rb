module CartodbImporter

  class ImportFile
    MAX_RETRIES = 120
    RETRY_DELAY = 0.5

    def initialize(url_gen)
      @url_gen = url_gen
    end

    def imports_url
      @url_gen.url(Import::PATH)
    end

    def import_status_url(import)
      uri = imports_url
      uri.path += "/#{import.item_queue_id}"
      uri
    end

    def import(local_file_name, remote_name = local_file_name)
      # remote filename should just be a different basename than local file name.
      if local_file_name != remote_name
        remote_name = "#{File.basename(remote_name, '.*')}#{File.extname(local_file_name)}"
      end
      request = RestClient::Request.new(
        method: :post,
        url: imports_url.to_s,
        payload: {
          multipart: true,
          filename: remote_name,
          file: File.new(local_file_name, 'rb')
        }
      )
      request.execute
    end

    def status(import)
      RestClient.get import_status_url(import).to_s
    end

    def wait_for_complete(import)
      times = 0
      begin
        body = status(import).body
        status = ImportStatusRepresenter.new(ImportStatus.new).from_json(body)
        times += 1
        sleep(RETRY_DELAY)
      end while (status.state != 'complete' && status.state != 'failure') || times > MAX_RETRIES

      status
    end

    def upload_table_for_org(local_file_name, remote_name = local_file_name)
      response = import(local_file_name, remote_name)
      import = ImportRepresenter.new(Import.new).from_json(response.body)
      status = wait_for_complete(import)
      if status.state == 'complete'
        SetPermission.new(@url_gen).set_table_org_permission(status.table_id, 'rw')
        true
      else
        false
      end
    end
  end
end