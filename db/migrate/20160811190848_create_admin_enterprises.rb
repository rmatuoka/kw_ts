class CreateAdminEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
