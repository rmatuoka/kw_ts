class AddColumnistToAdminArticles < ActiveRecord::Migration
  def change
    add_column :articles, :columnist, :string
  end
end
