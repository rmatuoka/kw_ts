class Admin::Enterprise < ActiveRecord::Base
	has_attached_file :img_enterprise
  validates_attachment :img_enterprise, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	has_attached_file :banner_enterprise
	validates_attachment :banner_enterprise, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	has_many :portfolios
end
