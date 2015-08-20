module CartodbImporter

  class SetPermission
    VIZ_PATH = '/api/v1/viz'

    def initialize(subdomainless_urls, scheme, session_domain, port, user_name, api_key)
      @url_gen = UrlGenerator.new(subdomainless_urls, scheme, session_domain, port, user_name, api_key)
    end

    def visualization_url
      @url_gen.url(VIZ_PATH)
    end

    def table_url
      uri = visualization_url
      query = CGI.parse(uri.query)
      uri.query = URI.encode_www_form(query.merge({ types: 'table' }))
      uri
    end

    def table
      RestClient.get table_url.to_s
    end
  end
end
