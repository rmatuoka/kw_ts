class AddFatherIdToAdminCategories < ActiveRecord::Migration
  def change
    add_column :admin_categories, :father_id, :integer
  end
end
