json.extract! user, :id, :login, :name, :crypted_password, :password_salt, :persistence_token, :login_count, :failed_login_count, :last_request_at, :current_login_at, :last_login_at, :current_login_ip, :last_login_ip, :created_at, :updated_at
json.url user_url(admin_user, format: :json)