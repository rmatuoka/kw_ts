class Admin::Enterprise < ActiveRecord::Base
	acts_as_taggable_on :tags
	
	has_attached_file :img_enterprise
  validates_attachment :img_enterprise, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	has_attached_file :banner_enterprise
	validates_attachment :banner_enterprise, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	has_many :portfolios
	has_and_belongs_to_many :wikis
	
end
