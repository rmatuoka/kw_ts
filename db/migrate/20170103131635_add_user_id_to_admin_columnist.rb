class AddUserIdToAdminColumnist < ActiveRecord::Migration
  def change
    add_column :admin_columnists, :user_id, :integer
  end
end
