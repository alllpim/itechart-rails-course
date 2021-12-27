class AddPersonIdInFinance < ActiveRecord::Migration[6.1]
  def change
    add_column :finances, :people_id, :integer
  end
end
