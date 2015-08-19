class Import < OpenStruct
  include Representable::JSON

  property :item_queue_id
  property :success
end