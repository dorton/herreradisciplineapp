class AddPreviousandnotesToSuspensions < ActiveRecord::Migration
  def change
    add_column :suspensions, :previous_actions, :string
    add_column :suspensions, :notes, :string
  end
end
