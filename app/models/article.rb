class Article < ActiveRecord::Base
  acts_as_taggable_on :tags
  
  has_attached_file :image_article
  validates_attachment :image_article, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  
  has_and_belongs_to_many :category
  belongs_to :columnist, class_name: 'Admin::Columnist'
  has_many :article_reads
  
  validates_presence_of :title
  validates_presence_of :subtitle
  validates_presence_of :description
  validates_presence_of :image_article

  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['published =  true and active = true and (title LIKE ? or subtitle LIKE ? or description LIKE ?)', "%#{search}%", "%#{search}%", "%#{search}%"])
  #   else
  #     find(:all)
  #   end
  # end
end
