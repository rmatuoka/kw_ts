class CreateAdminColumnists < ActiveRecord::Migration
  def change
    create_table :admin_columnists do |t|
      t.string :name
      t.string :description
      t.boolean :published, :default => 1
      t.boolean :active, :default => 1

      t.timestamps null: false
    end
  end
end
