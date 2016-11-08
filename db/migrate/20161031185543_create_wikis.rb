class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text :description
      t.boolean :active
      t.boolean :published

      t.timestamps null: false
    end
  end
end
