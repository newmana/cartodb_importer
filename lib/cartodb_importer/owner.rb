class Owner < OpenStruct
  include Representable::JSON

  property :id
  property :username
  property :email
  property :avatar_url
  property :base_url
  property :quota_in_bytes
  property :db_size_in_bytes
end
