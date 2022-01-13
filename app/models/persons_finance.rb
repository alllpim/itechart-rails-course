# frozen_string_literal: true

class PersonsFinance < ApplicationRecord
  belongs_to :person
  belongs_to :finance
  has_many :cash_transaction

  scope :person_expence, ->(person) { joins(:finance).where(person_id: person, finances: { incomeOrExpence: false }) }
  scope :person_income, ->(person) { joins(:finance).where(person_id: person, finances: { incomeOrExpence: true }) }

  def show_income_or_expence
    finance.incomeOrExpence ? 'Income' : 'Expense'
  end

  def info
    "Person: #{person.first_name}, Category: #{finance.name}, Operation: #{show_income_or_expence}"
  end
end
