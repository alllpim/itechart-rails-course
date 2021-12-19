class RemovePersonsCategory < ActiveRecord::Migration[6.1]
  def change
    remove_column :persons_categories, :name, :string
    remove_column :persons_categories, :count, :float
    add_column :persons_categories, :person_id, :integer
    add_column :persons_categories, :finance_id, :integer

  end
end
