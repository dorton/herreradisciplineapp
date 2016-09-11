class CreateDetentions < ActiveRecord::Migration
  def change
    create_table :detentions do |t|
      t.date :detention_date
      t.date :incident_date
      t.text :reason
      t.string :administrator
      t.references :student

      t.timestamps
    end
    add_index :detentions, :student_id
  end
end
