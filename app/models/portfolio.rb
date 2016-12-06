class Portfolio < ActiveRecord::Base
	has_attached_file :portfolio_img, styles: { medium: "226x160#", small: "50x50#" }
	validates_attachment :portfolio_img, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	
	belongs_to :admin_enterprise
end
