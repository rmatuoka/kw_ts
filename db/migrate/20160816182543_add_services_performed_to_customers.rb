class AddServicesPerformedToCustomers < ActiveRecord::Migration
  def change
    add_column :admin_customers, :services_performed, :text
  end
end
