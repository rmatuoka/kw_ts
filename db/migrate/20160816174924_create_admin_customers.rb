class CreateAdminCustomers < ActiveRecord::Migration
  def change
    create_table :admin_customers do |t|
      t.string :title
      t.text :description
      t.boolean :published, null: false, default: 1
      t.boolean :active, null: false, default: 1

      t.timestamps null: false
    end
  end
end
