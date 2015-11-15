class AddVideoToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :video, :string
  end
end
