module CartodbImporter

  class Entity < OpenStruct
  end

  class EntityRepresenter < Representable::Decorator
    include Representable::JSON

    property :id
    property :type
  end
end
