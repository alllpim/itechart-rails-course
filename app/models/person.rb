# frozen_string_literal: true

class Person < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :type_name, presence: true, length: { minimum: 3, maximum: 20 }

  belongs_to :user
  has_many :persons_finances
  has_many :finances, through: :persons_finances
  after_create :create_finance

  def create_finance
    finance = Finance.new(name: 'New finance', incomeOrExpence: true)
    finance.people << self
    finance.save
  end

  def destroy
    return false if user.person.count == 1
  end
end
