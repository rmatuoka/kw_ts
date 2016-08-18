class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.string :description
      t.integer :ordem,:null => false, :default => 0
      t.boolean :active,:null => false, :default => 1
      t.boolean :published,:null => false, :default => 1

      t.timestamps null: false
    end
  end
end
