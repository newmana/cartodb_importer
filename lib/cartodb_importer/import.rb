module CartodbImporter

  class Import < OpenStruct
  end

  class ImportRepresenter < Representable::Decorator
    include Representable::JSON

    property :item_queue_id
    property :success
  end
end