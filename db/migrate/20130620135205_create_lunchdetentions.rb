class CreateLunchdetentions < ActiveRecord::Migration
  def change
    create_table :lunchdetentions do |t|
      t.date :start_date
      t.date :end_date
      t.string :days
      t.date :incident_date
      t.text :reason
      t.string :administrator
      t.references :student

      t.timestamps
    end
    add_index :lunchdetentions, :student_id
  end
end
