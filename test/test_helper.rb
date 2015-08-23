require 'rubygems'
require 'test/unit'
require 'mocha/setup'
require 'webmock/test_unit'

require File.expand_path('../../lib/cartodb_importer', __FILE__)

HOST = 'localhost'
USER_NAME = 'yyy'
API_KEY =   'ffffffffffffffffffffffffffffffffffffffff'

URL_GEN = CartodbImporter::UrlGenerator.new(true, 'http', HOST, nil, USER_NAME, API_KEY)
