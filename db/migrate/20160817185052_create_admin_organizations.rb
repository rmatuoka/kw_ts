class CreateAdminOrganizations < ActiveRecord::Migration
  def change
    create_table :admin_organizations do |t|
      t.string :title
      t.string :description
      t.datetime :organization_start
      t.datetime :organization_finish
      t.boolean :active, :null => false, :default => 1
	  t.boolean :published, :null => false, :default => 1

      t.timestamps null: false
    end
  end
end
