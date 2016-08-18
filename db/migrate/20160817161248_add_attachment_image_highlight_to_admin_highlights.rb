class AddAttachmentImageHighlightToAdminHighlights < ActiveRecord::Migration
  def self.up
    add_column :admin_highlights, :image_highlight_file_name, :string
    add_column :admin_highlights, :image_highlight_content_type, :string
    add_column :admin_highlights, :image_highlight_file_size, :integer
    add_column :admin_highlights, :image_highlight_updated_at, :datetime
  end

  def self.down
    remove_column :admin_highlights, :image_highlight_file_name
    remove_column :admin_highlights, :image_highlight_content_type
    remove_column :admin_highlights, :image_highlight_file_size
    remove_column :admin_highlights, :image_highlight_updated_at
  end
end
