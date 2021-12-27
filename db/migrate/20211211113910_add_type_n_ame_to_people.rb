class AddTypeNAmeToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :type_name, :string
  end
end
