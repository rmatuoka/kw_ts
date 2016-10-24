class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :object_id
      t.string :object_type

      t.timestamps null: false
    end
  end
end
