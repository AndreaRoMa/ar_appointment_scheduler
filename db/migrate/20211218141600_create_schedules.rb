class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :name_user
      t.text :description

      t.timestamps
    end
  end
end
