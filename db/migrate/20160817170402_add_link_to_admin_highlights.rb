class AddLinkToAdminHighlights < ActiveRecord::Migration
  def change
    add_column :admin_highlights, :link, :string
  end
end
