module CartodbImporter

  class SetPermission

    def initialize(url_gen)
      @url_gen = url_gen
    end

    def visualization_url(id = nil)
      uri = @url_gen.url(Visualization::PATH)
      uri.path += "/#{id}" if id && !id.empty?
      uri
    end

    def permission_url(id)
      uri = @url_gen.url(Permission::PATH)
      uri.path += "/#{id}"
      uri
    end

    def table_url
      uri = visualization_url
      query = CGI.parse(uri.query)
      uri.query = URI.encode_www_form(query.merge({types: 'table'}))
      uri
    end

    def table
      RestClient.get table_url.to_s
    end

    def find_viz_by_property(property, value)
      out = VisualizationsRepresenter.new(Visualizations.new).from_json(table.body)
      result = out.visualizations.select { |v| v.send(property) == value }
      result.first
    end

    def find_viz_by_table_id(id)
      out = VisualizationsRepresenter.new(Visualizations.new).from_json(table.body)
      result = out.visualizations.select { |v| v.table.id == id }
      result.first
    end

    def set_table_org_permission(id, access)
      user = User.new(@url_gen)
      org = user.organization
      viz = find_viz_by_table_id(id)
      permission = Permission.new({type: 'org', access: access, entity: Entity.new({id: org.id, avatar_url: nil, username: org.name})})
      p = UpdatePermission.new(entity: Entity.new({id: viz.id, type: 'vis'}), acl: [permission])
      perm = UpdatePermissionRepresenter.new(p).to_json
      RestClient.put permission_url(viz.permission.id).to_s, perm, {'Content-Type' => 'application/json'}
    end

    def rename_table(id, name)
      viz = find_viz_by_table_id(id)
      viz.name = name
      new_viz = VisualizationRepresenter.new(viz).to_json
      RestClient.put visualization_url(viz.id).to_s, new_viz, {'Content-Type' => 'application/json'}
    end
  end
end
