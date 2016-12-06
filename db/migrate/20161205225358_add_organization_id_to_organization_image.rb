class AddOrganizationIdToOrganizationImage < ActiveRecord::Migration
  def change
    add_column :organization_images, :organization_id, :integer
  end
end
