class ImportFile
  IMPORT_PATH = '/api/v1/imports'
  USER_PATH = '/user/'
  MAX_RETRIES = 120
  RETRY_DELAY = 0.5

  def initialize(subdomainless_urls, scheme, session_domain, port, user_name, api_key)
    @subdomainless_urls = subdomainless_urls
    @scheme = scheme
    @session_domain = session_domain
    @port = port
    @user_name = user_name
    @api_key = api_key
  end

  def imports_url
    if @subdomainless_urls
      path = "#{USER_PATH}#{@user_name}#{IMPORT_PATH}"
      domain = @session_domain
    else
      path = IMPORT_PATH
      domain = "#{@user_name}.#{@session_domain}"
    end
    URI::HTTP.new(@scheme, nil, domain, @port, nil, path, nil, "api_key=#{@api_key}", nil)
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
      status = ImportStatus.new.from_json(body)
      times++
      sleep(RETRY_DELAY)
    end while status.state != "complete" || times > MAX_RETRIES
    status
  end
end