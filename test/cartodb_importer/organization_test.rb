require_relative '../test_helper'

module CartodbImporter

  class OrganizationTest < Test::Unit::TestCase
    def test_organization_url
      uri = URL_GEN.url(Organization::PATH)
      assert_equal('http://localhost/user/yyy/api/v1/org?api_key=ffffffffffffffffffffffffffffffffffffffff', uri.to_s)
    end
  end
end