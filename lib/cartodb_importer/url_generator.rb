module CartodbImporter
  class UrlGenerator
    USER_PATH = '/user/'

    def initialize(subdomainless_urls, scheme, session_domain, port, user_name, api_key)
      @subdomainless_urls = subdomainless_urls
      @scheme = scheme
      @session_domain = session_domain
      @port = port
      @user_name = user_name
      @api_key = api_key
    end

    def url(path)
      if @subdomainless_urls
        path = "#{USER_PATH}#{@user_name}#{path}"
        domain = @session_domain
      else
        domain = "#{@user_name}.#{@session_domain}"
      end
      URI::HTTP.new(@scheme, nil, domain, @port, nil, path, nil, "api_key=#{@api_key}", nil)
    end
  end
end