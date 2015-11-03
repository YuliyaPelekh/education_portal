class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :group
      t.string :lesson

      t.timestamps null: false
    end
  end
end
