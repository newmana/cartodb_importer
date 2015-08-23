module CartodbImporter

  class Import < OpenStruct
    PATH = '/api/v1/imports'
  end

  class ImportRepresenter < Representable::Decorator
    include Representable::JSON

    property :item_queue_id
    property :success
  end
end