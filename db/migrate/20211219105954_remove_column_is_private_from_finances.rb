class RemoveColumnIsPrivateFromFinances < ActiveRecord::Migration[6.1]
  def change
    remove_column :finances, :is_private, :boolean
  end
end
