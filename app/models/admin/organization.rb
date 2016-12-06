class Admin::Organization < ActiveRecord::Base
	has_many :organization_images
end
