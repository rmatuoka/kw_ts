class Role < ActiveRecord::Base
  acts_as_authorization_role join_table_name: :roles_users

  def role_params
      params.require(:role).permit(:name, :authorizable_type, :authorizable_id)
	end

end
