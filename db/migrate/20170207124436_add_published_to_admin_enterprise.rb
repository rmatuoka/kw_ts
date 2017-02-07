class AddPublishedToAdminEnterprise < ActiveRecord::Migration
  def change
    add_column :admin_enterprises, :published, :boolean, :default => false
    add_column :admin_enterprises, :active, :boolean, :default => true
  end
end
