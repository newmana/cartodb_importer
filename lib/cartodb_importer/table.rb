module CartodbImporter

  class Table < OpenStruct
  end

  class TableRepresenter < Representable::Decorator
    include Representable::JSON

    property :id
    property :name
    property :permission, class: Permission, decorator: PermissionRepresenter
    property :entity, class: Entity, decorator: EntityRepresenter
    collection :acl, class: Acl, decorator: AclRepresenter
    property :created_at
    property :updated_at
  end
end