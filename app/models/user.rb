class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :person

  after_create :create_person

  def create_person
    Person.create(first_name: "first_name", last_name: "last_name", type_name: "type_name", created_at: Time.now, updated_at: Time.now, user_id: self.id)
  end
end
