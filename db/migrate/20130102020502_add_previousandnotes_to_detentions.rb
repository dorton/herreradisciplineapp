class AddPreviousandnotesToDetentions < ActiveRecord::Migration
  def change
    add_column :detentions, :previous_actions, :string
    add_column :detentions, :notes, :string
  end
end
