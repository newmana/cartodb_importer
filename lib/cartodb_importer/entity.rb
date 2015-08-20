class Entity < OpenStruct
  include Representable::JSON

  property :id
  property :type
end
