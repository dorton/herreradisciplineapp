class AddFieldsToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :teacher, :string
    add_column :searches, :last_name, :string
    add_column :searches, :first_name, :string
    add_column :searches, :grade, :string
  end
end
