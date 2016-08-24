class AddLastNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :birthdate, :string
    add_column :users, :company, :string
    add_column :users, :services_performed, :string
    add_column :users, :cep, :string
    add_column :users, :street, :string
    add_column :users, :number, :string
    add_column :users, :neighborhood, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
