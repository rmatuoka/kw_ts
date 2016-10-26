class User < ActiveRecord::Base
  attr_accessor :role

  has_many :likes
  has_many :comments

  acts_as_authentic do |c|
    c.login_field = "email"
  end
  
  acts_as_authorization_subject :association_name => :roles, :join_table_name => :roles_users
  after_save :define_role
  
  
  
  has_attached_file :picture, styles: { medium: "226x260#", small: "50x50#" }
	validates_attachment :picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	
  
  def profile_perc
    total = 0
    total = total + 8.33 if self.name.present? 
    total = total + 8.33 if self.last_name.present? 
    total = total + 8.33 if self.email.present? 
    total = total + 8.33 if self.birthdate.present? 
    total = total + 8.33 if self.company.present? 
    total = total + 8.33 if self.services_performed.present? 
    total = total + 8.33 if self.cep.present? 
    total = total + 8.33 if self.street.present? 
    total = total + 8.33 if self.number.present? 
    total = total + 8.33 if self.neighborhood.present? 
    total = total + 8.33 if self.city.present? 
    total = total + 8.33 if self.state.present? 
      
    return total.ceil
  end
  
  def role
    @role
    if self.has_role? :administrator
      @role = :administrator
    elsif self.has_role? :supervisor
      @role = :supervisor
    else self.has_role? :user
      @role = :user
    end
  end

  def define_role
    if @role
      self.has_no_roles!
      self.has_role! @role
    end
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
  end
end
