class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :cash_transactions do |t|
      t.integer :persons_finance_id
      t.float :amount
      t.boolean :is_important, default: false

      t.timestamps
    end
  end
end
