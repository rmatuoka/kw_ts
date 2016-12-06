class AddItensToAdminEnterprise < ActiveRecord::Migration
  def change
    add_column :admin_enterprises, :address, :string
    add_column :admin_enterprises, :number, :string
    add_column :admin_enterprises, :string, :string
    add_column :admin_enterprises, :phone, :string
    add_column :admin_enterprises, :email, :string
    add_column :admin_enterprises, :site, :string
  end
end
