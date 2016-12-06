class AddStateToAdminEnterprise < ActiveRecord::Migration
  def change
    add_column :admin_enterprises, :city, :string
    add_column :admin_enterprises, :state, :string
  end
end
