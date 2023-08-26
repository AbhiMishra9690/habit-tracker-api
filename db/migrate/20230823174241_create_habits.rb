class CreateHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :habits do |t|
      t.string :name
      t.float :each_time_spend_in_minutes
      t.integer :count_in_a_day

      t.timestamps
    end
  end
end
