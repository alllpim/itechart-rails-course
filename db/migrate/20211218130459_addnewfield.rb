class Addnewfield < ActiveRecord::Migration[6.1]
  def change
    add_column :finances, :is_private, :boolean
  end
end
