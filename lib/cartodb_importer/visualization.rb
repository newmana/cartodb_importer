module CartodbImporter

  class Visualization < OpenStruct
  end

  class VisualizationRepresenter < Representable::Decorator
    include Representable::JSON

    property :id
    property :name
    property :map_id
    property :active_layer_id
    property :type
    collection :tags
    property :description
    property :privacy
    property :stats
    property :created_at
    property :updated_at
    property :permission, class: Permission
    property :locked
    property :source
    property :title
    property :parent_id
    property :license
    property :attributions
    property :kind
    property :likes
    property :prev_id
    property :next_id
    hash :transition_options
    property :active_children
    property :table, class: Table
    property :external_source
    property :synchronization
    collection :children
    property :liked
  end
end