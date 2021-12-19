class CreatePersonsCategory < ActiveRecord::Migration[6.1]
  def change
    create_table :persons_categories do |t|
      t.integer :person_id
      t.integer :finance_category_id
      t.timestamps
    end
  end
end
