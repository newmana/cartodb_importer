class ImportFile
  IMPORT_PATH = '/api/v1/imports'
  USER_PATH = '/user/'

  def self.construct_url(subdomainless_urls, scheme, session_domain, port, user_name, api_key)
    if subdomainless_urls
      path = "#{USER_PATH}#{user_name}#{IMPORT_PATH}"
      domain = session_domain
    else
      path = IMPORT_PATH
      domain = "#{user_name}.#{session_domain}"
    end
    uri = URI::HTTP.new(scheme, nil, domain, port, nil, path, nil, "api_key=#{api_key}", nil)
    uri.to_s
  end

  def self.import(url, file_name)
    RestClient.post url, :filename => File.new(file_name, 'rb')
  rescue RestClient::ExceptionWithResponse => err
    err.response
  end
end