class AddOrdemToCustomers < ActiveRecord::Migration
  def change
    add_column :admin_customers, :ordem, :integer
  end
end
