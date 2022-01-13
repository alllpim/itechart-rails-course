# frozen_string_literal: true

class Finance < ApplicationRecord
  has_many :persons_finances
  has_many :people, through: :persons_finances

  def show_income_or_expence
    incomeOrExpence ? 'Income' : 'Expense'
  end
end
