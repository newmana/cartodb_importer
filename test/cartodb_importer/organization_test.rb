require_relative '../test_helper'

module CartodbImporter

  class OrganizationTest < Test::Unit::TestCase
    API_KEY = (1..40).inject('') { |s, _| s + 'f' }

    def test_organization_url
      url_gen = UrlGenerator.new(true, 'http', 'test.com', nil, 'suser', API_KEY)
      uri = url_gen.url(Organization::ORGANIZATION_PATH)
      assert_equal('http://test.com/user/suser/api/v1/org?api_key=ffffffffffffffffffffffffffffffffffffffff', uri.to_s)
    end
  end
end