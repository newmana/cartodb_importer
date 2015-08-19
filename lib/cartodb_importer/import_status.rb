class ImportStatus < OpenStruct
  include Representable::JSON

  property :id
  property :user_id
  property :table_id
  property :data_type
  property :table_name
  property :state
  property :error_code
  property :queue_id
  property :tables_created_count
  property :synchronization_id
  property :type_guessing
  property :quoted_fields_guessing
  property :content_guessing
  property :create_visualization
  property :visualization_id
  property :user_defined_limits
  property :get_error_text
  property :display_name
  property :success
  property :any_table_raster
  property :derived_visualization_id
end