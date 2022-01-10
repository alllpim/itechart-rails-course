class RebuildDb < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :cash_transactions, :notes
  end
end
