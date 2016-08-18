class Admin::Highlight < ActiveRecord::Base
	has_attached_file :image_highlight
	validates_attachment :image_highlight, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
