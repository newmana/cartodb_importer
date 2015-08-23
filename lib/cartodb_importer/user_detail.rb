module CartodbImporter
  class UserDetail

    def initialize(url_gen)
      @url_gen = url_gen
    end

    def organization
      response = RestClient.get @url_gen.url(Organization::ORGANIZATION_PATH).to_s
      OrganizationRepresenter.new(Organization.new).from_json(response.body)
    end
  end
end