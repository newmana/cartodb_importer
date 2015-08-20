require '../test_helper'

module CartodbImporter

  class FindUserDetailTest < Test::Unit::TestCase
    API_KEY = (1..40).inject('') { |s, _| s + 'f' }

    def test_organization_url
      url_gen = new UrlGenerator(true, 'http', 'test.com', nil, 'suser', API_KEY)
      uri = FindUserDetail.new(url_gen).organization_url
      assert_equal('http://test.com/user/suser/api/v1/org?api_key=ffffffffffffffffffffffffffffffffffffffff', uri.to_s)
    end
  end
end