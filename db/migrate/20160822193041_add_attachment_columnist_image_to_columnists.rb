class AddAttachmentColumnistImageToColumnists < ActiveRecord::Migration
  def self.up
    change_table :admin_columnists do |t|
      t.attachment :admin_columnists
    end
  end

  def self.down
    remove_attachment :admin_columnists, :columnist_image
  end
end
