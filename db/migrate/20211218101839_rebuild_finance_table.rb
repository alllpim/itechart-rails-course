class RebuildFinanceTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :finances, :financeCategory
    remove_column :financeCategory, :count, :float
    remove_column :financeCategory, :person_id, :integer
    add_column :financeCategory, :incomeOrExpence, :boolean
  end
end
