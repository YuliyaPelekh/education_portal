class RemoveAvatarFromNews < ActiveRecord::Migration
  def change
    remove_column :news, :avatar, :string
  end
end
