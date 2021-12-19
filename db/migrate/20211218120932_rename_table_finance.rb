class RenameTableFinance < ActiveRecord::Migration[6.1]
  def change
    rename_table :finance, :finances
  end
end
