require '../test_helper'

class ImportFileTest < Test::Unit::TestCase
  API_KEY = (1..40).inject(''){|s,_| s + 'f'}

  def test_schemaless_url
    s = ImportFile.construct_url(true, 'http', 'test.com', nil, 'suser', API_KEY)
    assert_equal('http://test.com/user/suser/api/v1/imports?api_key=ffffffffffffffffffffffffffffffffffffffff', s)
  end

  def test_schema_url
    s = ImportFile.construct_url(false, 'http', 'test.com', nil, 'suser', API_KEY)
    assert_equal('http://suser.test.com/api/v1/imports?api_key=ffffffffffffffffffffffffffffffffffffffff', s)
  end
end