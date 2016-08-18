class CreateAdminHighlights < ActiveRecord::Migration
  def change
    create_table :admin_highlights do |t|
      t.string :title
      t.string :subtitle
      t.integer :ordem
      t.boolean :active
      t.boolean :published

      t.timestamps null: false
    end
  end
end
