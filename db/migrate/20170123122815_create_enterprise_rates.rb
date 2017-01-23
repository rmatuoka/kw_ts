class CreateEnterpriseRates < ActiveRecord::Migration
  def change
    create_table :enterprise_rates do |t|
      t.string :enterprise_id
      t.integer :rate
      t.integer :user_id
      t.text :comment
      t.boolean :agreement

      t.timestamps null: false
    end
  end
end
