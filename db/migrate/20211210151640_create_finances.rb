class CreateFinances < ActiveRecord::Migration[6.1]
  def change
    create_table :finances do |t|
      t.string :name
      t.float :count

      t.timestamps
    end
  end
end
