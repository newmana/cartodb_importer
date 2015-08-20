module CartodbImporter

  class SetPermission
    VIZ_PATH = '/api/v1/viz'
    PERM_PATH = '/api/v1/perm'

    def initialize(url_gen)
      @url_gen = url_gen
    end

    def visualization_url
      @url_gen.url(VIZ_PATH)
    end

    def permission_url(id)
      uri = @url_gen.url(PERM_PATH)
      uri.path += "/#{id}"
      uri
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
      result = out.visualizations.select { |v| v.name == name }
      result.first
    end

    def set_viz_org_permission(name, access)
      user = FindUserDetail.new(@url_gen)
      org = user.organization
      viz = find_viz_by_name(name)
      permission = Permission.new({ type: 'org', access: access, entity: Entity.new({ id: viz.permission.id, avatar_url: nil, username: org.name }) })
      p = UpdatePermission.new(entity: Entity.new({ id: viz.id, type: 'vis' }), acl: [permission])
      perm = UpdatePermissionRepresenter.new(p).to_json
      RestClient.put permission_url(viz.permission.id).to_s, perm
    end
  end
end
