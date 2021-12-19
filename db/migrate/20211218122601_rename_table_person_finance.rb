class RenameTablePersonFinance < ActiveRecord::Migration[6.1]
  def change
    rename_table :persons_finance, :person_finances
  end
end
