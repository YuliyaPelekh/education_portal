class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :text
      t.string :avatar

      t.timestamps null: false
    end
  end
end
