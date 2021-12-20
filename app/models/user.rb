# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :person

  after_create :create_person

  def create_person
    Person.create(user_id: id, type_name: 'Me', first_name: 'Add your first name', last_name: 'Add your last name')
  end
end
