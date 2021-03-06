require_relative '../test_helper'

module CartodbImporter

  class SetPermissionTest < Test::Unit::TestCase
    API_KEY = (1..40).inject('') { |s, _| s + 'f' }
    URL_GEN_1 = UrlGenerator.new(true, 'http', 'test.com', nil, 'suser', API_KEY)
    URL_GEN_2 = UrlGenerator.new(false, 'http', 'test.com', nil, 'suser', API_KEY)

    def test_visualization_url
      uri = SetPermission.new(URL_GEN_1).visualization_url
      assert_equal('http://test.com/user/suser/api/v1/viz?api_key=ffffffffffffffffffffffffffffffffffffffff', uri.to_s)
    end

    def test_table_url
      uri = SetPermission.new(URL_GEN_2).table_url
      assert_equal('http://suser.test.com/api/v1/viz?api_key=ffffffffffffffffffffffffffffffffffffffff&types=table', uri.to_s)
    end
  end
end