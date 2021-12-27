class RenameTablePerFin < ActiveRecord::Migration[6.1]
  def change
    rename_table :persons_finances, :persons_finance
  end
end
