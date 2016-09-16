class CreateAdminPortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :title
      t.integer :ordem
      t.integer :enterprise_id
      t.boolean :active, :default => 1
      t.boolean :published, :default => 1

      t.timestamps null: false
    end
  end
end
