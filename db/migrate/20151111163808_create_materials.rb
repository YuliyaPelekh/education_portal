class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :sort
      t.string :avatar
      t.text :description

      t.timestamps null: false
    end
  end
end
