class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text :description
      t.boolean :active, :default => :true
      t.boolean :published, :default => :false

      t.timestamps null: false
    end
  end
end
