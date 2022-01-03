# frozen_string_literal: true

class PersonsFinance < ApplicationRecord
  belongs_to :person
  belongs_to :finance
  has_many :cash_transactions

  def show_income_or_expence
    finance.incomeOrExpence ? 'Income' : 'Expence'
  end

  def show_title
    "Person: #{person.first_name}, Category: #{finance.name}, Operation: #{show_income_or_expence}"
  end
end
