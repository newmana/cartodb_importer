class Permission < OpenStruct
  include Representable::JSON

  property :id
  property :owner, class: Owner
  property :entity, class: Entity
  collection :acl
  property :created_at
  property :updated_at
end
