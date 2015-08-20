module CartodbImport

  class Table < OpenStruct
    include Representable::JSON

    property :id
    property :name
    property :permission, class: Permission
    property :entity, class: Entity
    collection :acl
    property :created_at
    property :updated_at
  end
end