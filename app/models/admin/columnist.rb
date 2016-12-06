class Admin::Columnist < ActiveRecord::Base
	has_attached_file :admin_columnists, styles: { medium: "226x260#", small: "50x50#" }, default_url: "/images/user_missing_:style.png"
	
	validates_attachment :admin_columnists, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	has_many :articles, dependent: :destroy
	
	
end
