json.extract! admin_organization, :id, :title, :description, :organization_start, :organization_finish, :created_at, :updated_at
json.url admin_organization_url(admin_organization, format: :json)