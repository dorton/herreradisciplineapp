class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :last_name
      t.string :first_name
      t.string :grade
      t.integer :stu_id
      t.string :teacher
      t.string :parent_name

      t.timestamps
    end
  end
end
