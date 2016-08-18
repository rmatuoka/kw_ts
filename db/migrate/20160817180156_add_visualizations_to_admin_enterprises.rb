class AddVisualizationsToAdminEnterprises < ActiveRecord::Migration
  def change
    add_column :admin_enterprises, :visualizations, :integer
  end
end
