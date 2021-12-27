# frozen_string_literal: true

class PersonsFinance < ApplicationRecord
  belongs_to :person
  belongs_to :finance
end
