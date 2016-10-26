class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :feed_id
      t.integer :user_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
