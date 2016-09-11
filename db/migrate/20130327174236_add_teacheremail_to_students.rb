class AddTeacheremailToStudents < ActiveRecord::Migration
  def change
    add_column :students, :teacheremail, :string
  end
end
