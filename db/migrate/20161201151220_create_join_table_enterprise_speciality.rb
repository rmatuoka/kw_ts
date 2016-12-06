class CreateJoinTableEnterpriseSpeciality < ActiveRecord::Migration
  def change
    create_join_table :enterprises, :specialities do |t|
      # t.index [:enterprise_id, :speciality_id]
      # t.index [:speciality_id, :enterprise_id]
    end
  end
end
