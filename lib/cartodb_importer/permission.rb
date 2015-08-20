module CartodbImporter

  class Permission < OpenStruct
  end

  class PermissionRepresenter < Representable::Decorator
    include Representable::JSON

    property :id
    property :owner, class: Owner, decorator: OwnerRepresenter
    property :entity, class: Entity, decorator: EntityRepresenter
    collection :acl, :class => Acl, :decorator => AclRepresenter
    property :created_at
    property :updated_at
  end
end