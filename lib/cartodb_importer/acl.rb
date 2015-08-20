module CartodbImporter

  class Acl < OpenStruct
  end

  class AclRepresenter < Representable::Decorator
    include Representable::JSON

    property :type
    property :entity, class: Owner, decorator: OwnerRepresenter
    property :access
  end
end