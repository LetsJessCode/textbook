class ChangeColumnNameOnAssignments < ActiveRecord::Migration[6.0]
  def change
    change_column :assignments, :completed, :string
  end
end
