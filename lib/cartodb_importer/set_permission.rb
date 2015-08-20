module CartodbImporter

  class SetPermission
    VIZ_PATH = '/api/v1/viz'

    def initialize(url_gen)
      @url_gen = url_gen
    end

    def visualization_url
      @url_gen.url(VIZ_PATH)
    end

    def table_url
      uri = visualization_url
      query = CGI.parse(uri.query)
      uri.query = URI.encode_www_form(query.merge({ types: 'table' }))
      uri
    end

    def table
      RestClient.get table_url.to_s
    end

    def find_viz_by_name(name)
      out = VisualizationsRepresenter.new(Visualizations.new).from_json(table.body)
      out.visualizations.select { |v| v.name = name }.first
    end

    def set_viz_org_permission(name, permission)
      viz = find_viz_by_name(name)
      puts Permission.new({entity: {id: viz.permission.id, type: :vis}, acl: []})
      viz.id + " " + viz.permission.id
    end
  end
end
