class Feed < ActiveRecord::Base
  has_many :comments
  has_many :likes
end
