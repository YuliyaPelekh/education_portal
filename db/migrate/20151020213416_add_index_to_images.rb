class AddIndexToImages < ActiveRecord::Migration
  def change
  	add_index :images, :news_id
  end
end
