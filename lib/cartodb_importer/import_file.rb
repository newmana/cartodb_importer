module CartodbImporter

  class ImportFile
    IMPORT_PATH = '/api/v1/imports'
    MAX_RETRIES = 120
    RETRY_DELAY = 0.5

    def initialize(url_gen)
      @url_gen = url_gen
    end

    def imports_url
      @url_gen.url(IMPORT_PATH)
    end

    def import_status_url(import)
      uri = imports_url
      uri.path += "/#{import.item_queue_id}"
      uri
    end

    def import(file_name)
      RestClient.post imports_url.to_s, :filename => File.new(file_name, 'rb')
    end

    def status(import)
      RestClient.get import_status_url(import).to_s
    end

    def wait_for_complete(import)
      times = 0
      begin
        body = status(import).body
        status = ImportStatusRepresenter.new(ImportStatus.new).from_json(body)
        times++
        sleep(RETRY_DELAY)
      end while status.state != "complete" || times > MAX_RETRIES
      status
    end

    def upload_table_for_org(import)
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