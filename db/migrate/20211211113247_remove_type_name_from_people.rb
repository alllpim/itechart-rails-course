class RemoveTypeNameFromPeople < ActiveRecord::Migration[6.1]
  def change
    remove_column :people, :type_name, :string
  end
end
