module CartodbImport

  class Visualizations < OpenStruct
  end

  class VisualizationsRepresenter < Representable::Decorator
    include Representable::JSON

    collection :visualizations, :class => Visualization, :decorator => VisualizationRepresenter
    property :total_entries
    property :total_user_entries
    property :total_likes
    property :total_shared
  end
end