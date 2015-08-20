module CartodbImporter

  class UpdatePermission < OpenStruct
  end

  class UpdatePermissionRepresenter < Representable::Decorator
    include Representable::JSON

    property :entity, class: Entity, decorator: EntityRepresenter
    collection :acl, :class => Acl, :decorator => AclRepresenter
  end
end