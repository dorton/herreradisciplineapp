class CreateGradelevels < ActiveRecord::Migration
  def change
    create_table :gradelevels do |t|
      t.date :gldate
      t.date :glincident_date
      t.text :glreason
      t.string :glteacher
      t.references :student

      t.timestamps
    end
    add_index :gradelevels, :student_id
  end
end
