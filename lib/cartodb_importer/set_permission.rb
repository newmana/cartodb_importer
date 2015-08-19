class SetPermission
  VIZ_PATH = '/api/v1/viz'
  USER_PATH = '/user/'

  def initialize(subdomainless_urls, scheme, session_domain, port, user_name, api_key)
    @subdomainless_urls = subdomainless_urls
    @scheme = scheme
    @session_domain = session_domain
    @port = port
    @user_name = user_name
    @api_key = api_key
  end

  def visualization_url
    if @subdomainless_urls
      path = "#{USER_PATH}#{@user_name}#{VIZ_PATH}"
      domain = @session_domain
    else
      path = VIZ_PATH
      domain = "#{@user_name}.#{@session_domain}"
    end
    URI::HTTP.new(@scheme, nil, domain, @port, nil, path, nil, "api_key=#{@api_key}", nil)
  end

  def table_url
    uri = visualization_url
    query = CGI.parse(uri.query)
    uri.query = URI.encode_www_form(query.merge({types: 'table'}))
    uri
  end

  def table
    RestClient.get table_url.to_s
  end
end