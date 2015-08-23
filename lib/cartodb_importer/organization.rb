module CartodbImporter
  class Organization < OpenStruct
    ORGANIZATION_PATH = '/api/v1/org'
  end

  class OrganizationRepresenter < Representable::Decorator
    include Representable::JSON

    property :id
    property :created_at
    property :description
    property :display_name
    property :name
    property :owner, class: Owner, decorator: OwnerRepresenter
    property :quota_in_bytes
    property :geocoding_quota
    property :map_view_quota
    property :twitter_datasource_quota
    property :map_view_block_price
    property :geocoding_block_price
    property :seats
    property :twitter_username
    property :updated_at
    property :website
    property :admin_email
    property :avatar_url
  end
end