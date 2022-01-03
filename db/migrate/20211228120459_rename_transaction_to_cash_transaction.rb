class RenameTransactionToCashTransaction < ActiveRecord::Migration[6.1]
  def change
    rename_table :transactions, :cash_transactions
  end
end
