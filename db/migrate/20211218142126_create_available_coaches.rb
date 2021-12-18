class CreateAvailableCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :available_coaches do |t|
      t.string :name
      t.string :day_of_week
      t.date :available_at
      t.date :available_until
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
