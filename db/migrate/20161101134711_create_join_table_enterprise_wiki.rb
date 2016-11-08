class CreateJoinTableEnterpriseWiki < ActiveRecord::Migration
  def change
    create_join_table :enterprises, :wikis do |t|
      # t.index [:enterprise_id, :wiki_id]
      # t.index [:wiki_id, :enterprise_id]
    end
  end
end
