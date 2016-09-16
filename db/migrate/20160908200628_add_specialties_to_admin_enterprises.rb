class AddSpecialtiesToAdminEnterprises < ActiveRecord::Migration
  def change
    add_column :admin_enterprises, :specialties, :string
  end
end
