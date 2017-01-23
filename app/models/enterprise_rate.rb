class EnterpriseRate < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin_enterprise
  
  validates_presence_of :comment
  validates_presence_of :agreement
end
