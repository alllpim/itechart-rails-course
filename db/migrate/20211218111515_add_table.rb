class AddTable < ActiveRecord::Migration[6.1]
  def change
    create_table :persons_finances do |t|
      t.integer :person_id
      t.integer :finance_id
      t.timestamps
      end
  end
end
