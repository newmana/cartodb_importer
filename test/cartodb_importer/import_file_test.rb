require '../test_helper'

module CartodbImporter

  class ImportFileTest < Test::Unit::TestCase
    API_KEY = (1..40).inject('') { |s, _| s + 'f' }

    def test_schemaless_url
      uri = ImportFile.new(true, 'http', 'test.com', nil, 'suser', API_KEY).imports_url
      assert_equal('http://test.com/user/suser/api/v1/imports?api_key=ffffffffffffffffffffffffffffffffffffffff', uri.to_s)
    end

    def test_schema_url
      uri = ImportFile.new(false, 'http', 'test.com', nil, 'suser', API_KEY).imports_url
      assert_equal('http://suser.test.com/api/v1/imports?api_key=ffffffffffffffffffffffffffffffffffffffff', uri.to_s)
    end

    def test_import_status_url
      import = Import.new({ item_queue_id: 123, success: true })
      uri = ImportFile.new(false, 'http', 'test.com', nil, 'suser', API_KEY).import_status_url(import)
      assert_equal('http://suser.test.com/api/v1/imports/123?api_key=ffffffffffffffffffffffffffffffffffffffff', uri.to_s)
    end
  end
end