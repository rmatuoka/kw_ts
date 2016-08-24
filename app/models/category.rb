class Category < ActiveRecord::Base
	# has_many :children, class_name: "Category", foreign_key: "father_id", dependent: :destroy
 	# belongs_to :father, class_name: "Category"
	has_and_belongs_to_many :articles
end
