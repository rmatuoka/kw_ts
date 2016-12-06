class AddAttachmentImageToOrganizationImages < ActiveRecord::Migration
  def self.up
    change_table :organization_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :organization_images, :image
  end
end
