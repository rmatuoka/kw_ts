class EnterpriseRate < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin_enterprises
  
  validates_presence_of :comment
  validates_presence_of :agreement
end
