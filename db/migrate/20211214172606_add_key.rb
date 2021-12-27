class AddKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key(:people, :users, dependent: :delete)
  end
end
