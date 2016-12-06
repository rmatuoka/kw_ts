class CreateSpecialities < ActiveRecord::Migration
  def change
    create_table :specialities do |t|
      t.string :name
      t.text :description
      t.boolean :published, :default => true
      t.boolean :active, :default => false

      t.timestamps null: false
    end
  end
end
