module CartodbImporter
  class FindUserDetail
    ORGANIZATION_PATH = '/api/v1/org'
    USER_PATH = '/user/'

    def initialize(url_gen)
      @url_gen = url_gen
    end

    def organization_url
      @url_gen.url(ORGANIZATION_PATH)
    end

    def organization
      response = RestClient.get organization_url.to_s
      OrganizationRepresenter.new(Organization.new).from_json(response.body)
    end
  end
end