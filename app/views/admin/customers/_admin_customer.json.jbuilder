json.extract! admin_customer, :id, :title, :description, :published, :active, :created_at, :updated_at
json.url admin_customer_url(admin_customer, format: :json)