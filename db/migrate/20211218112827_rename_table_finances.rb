class RenameTableFinances < ActiveRecord::Migration[6.1]
  def change
    rename_table :finances, :finance
  end
end
