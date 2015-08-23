require_relative '../test_helper'

module CartodbImporter

  class OrganizationTest < Test::Unit::TestCase
    API_KEY = (1..40).inject('') { |s, _| s + 'f' }

    def test_organization_url
      uri = URL_GEN.url(Organization::PATH)
      assert_equal('http://test.com/user/suser/api/v1/org?api_key=ffffffffffffffffffffffffffffffffffffffff', uri.to_s)
    end
  end
end