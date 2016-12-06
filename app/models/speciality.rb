class Speciality < ActiveRecord::Base
  has_and_belongs_to_many :enterprises, class_name: 'Admin::Enterprise'
end
