require_relative '../test_helper'

module CartodbImporter

  class UserDetailTest < Test::Unit::TestCase
    TEST_DATA = {
        "id": "ffffffff-7777-7777-9999-ffffffffffff",
        "created_at": "2015-08-18T00:27:26+00:00",
        "display_name": "xxx",
        "name": "xxx",
        "owner": {
            "id": "ffffffff-dddd-dddd-dddd-ffffffffffff",
            "username": "yyy",
            "email": "yyy@xxx.com",
            "avatar_url": "//localhost/avatars/avatar_mountains_blue.png"
        },
        "quota_in_bytes": 100,
        "geocoding_quota": 100,
        "twitter_datasource_quota": 0,
        "seats": 1000,
        "updated_at": "2015-08-18T00:48:01+00:00",
        "admin_email": "zzz@xxx.com"
    }

    def test_organization_url
      stub_request(:any, URL_GEN.url(Organization::PATH).to_s).
          to_return(body: TEST_DATA.to_json, status: 200)
      detail = UserDetail.new(URL_GEN)
      assert_equal('xxx', detail.organization.name)
    end
  end
end