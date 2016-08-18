class Admin::Customer < ActiveRecord::Base
	has_attached_file :company_logo
	validates_attachment :company_logo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
