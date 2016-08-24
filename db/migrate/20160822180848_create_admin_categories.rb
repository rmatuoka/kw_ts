class CreateAdminCategories < ActiveRecord::Migration
  def change
    create_table :admin_categories do |t|
      t.string :name
      t.string :description
      t.integer :ordem
      t.boolean :published, :default => 1
      t.boolean :active, :default => 1

      t.timestamps null: false
    end
  end
end
