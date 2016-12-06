class AddFeaturedToAdminEnterprise < ActiveRecord::Migration
  def change
    add_column :admin_enterprises, :featured, :boolean, :default => false
  end
end
