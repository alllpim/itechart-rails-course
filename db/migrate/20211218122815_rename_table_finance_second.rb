class RenameTableFinanceSecond < ActiveRecord::Migration[6.1]
  def change
    rename_table :person_finances, :persons_finances
  end
end
