class Article < ActiveRecord::Base
  # attr_accessible :title, :subtitle, :description, :order, :active, :published, :tag_list, :image_article
  acts_as_taggable
  has_attached_file :image_article
  validates_attachment :image_article, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  
  has_and_belongs_to_many :category
  belongs_to :columnists

  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['published =  true and active = true and (title LIKE ? or subtitle LIKE ? or description LIKE ?)', "%#{search}%", "%#{search}%", "%#{search}%"])
  #   else
  #     find(:all)
  #   end
  # end
end
