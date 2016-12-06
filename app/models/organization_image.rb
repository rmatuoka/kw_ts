class OrganizationImage < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "226x260#", small: "50x50#" }
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	belongs_to :organization, class_name: 'Admin::Organization'
end
