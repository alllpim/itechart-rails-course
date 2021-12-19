class RenameColumnPeopleIdInFinances < ActiveRecord::Migration[6.1]
  def change
    rename_column :finances, :people_id, :person_id
  end
end
