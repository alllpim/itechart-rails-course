class AddTableNote < ActiveRecord::Migration[6.1]
  def change
    add_column :cash_transactions, :note_id, :integer
  end
end
