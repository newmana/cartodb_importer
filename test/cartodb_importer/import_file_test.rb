require '../test_helper'

module CartodbImporter

  class ImportFileTest < Test::Unit::TestCase
    API_KEY = (1..40).inject('') { |s, _| s + 'f' }
    URL_GEN_1 = UrlGenerator.new(true, 'http', 'test.com', nil, 'suser', API_KEY)
    URL_GEN_2 = UrlGenerator.new(false, 'http', 'test.com', nil, 'suser', API_KEY)

    def test_schemaless_url
      uri = ImportFile.new(URL_GEN_1).imports_url
      assert_equal('http://test.com/user/suser/api/v1/imports?api_key=ffffffffffffffffffffffffffffffffffffffff', uri.to_s)
    end

    def test_schema_url
      uri = ImportFile.new(URL_GEN_2).imports_url
      assert_equal('http://suser.test.com/api/v1/imports?api_key=ffffffffffffffffffffffffffffffffffffffff', uri.to_s)
    end

    def test_import_status_url
      import = Import.new({ item_queue_id: 123, success: true })
      uri = ImportFile.new(URL_GEN_2).import_status_url(import)
      assert_equal('http://suser.test.com/api/v1/imports/123?api_key=ffffffffffffffffffffffffffffffffffffffff', uri.to_s)
    end
  end
end