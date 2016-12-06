class CreateOrganizationImages < ActiveRecord::Migration
  def change
    create_table :organization_images do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
