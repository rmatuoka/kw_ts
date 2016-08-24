class Admin::Columnist < ActiveRecord::Base
	has_attached_file :admin_columnists
	validates_attachment :admin_columnists, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	has_many :articles
end
