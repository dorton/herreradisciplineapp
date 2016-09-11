class AddPreviousandnotesToInschools < ActiveRecord::Migration
  def change
    add_column :inschools, :previous_actions, :string
    add_column :inschools, :notes, :string
  end
end
