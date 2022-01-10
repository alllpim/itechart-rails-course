# frozen_string_literal: true

class Note < ApplicationRecord
  belongs_to :cash_transaction, optional: true
  validates :note_text, presence: true, length: { maximum: 100 }
end
