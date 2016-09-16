class AddAttachmentImgEnterpriseBannerEnterpriseToAdminEnterprises < ActiveRecord::Migration
  def self.up
    change_table :admin_enterprises do |t|
      t.attachment :img_enterprise
      t.attachment :banner_enterprise
    end
  end

  def self.down
    remove_attachment :admin_enterprises, :img_enterprise
    remove_attachment :admin_enterprises, :banner_enterprise
  end
end
