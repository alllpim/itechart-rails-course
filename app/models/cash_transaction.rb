# frozen_string_literal: true

class CashTransaction < ApplicationRecord
  belongs_to :persons_finance
  belongs_to :note, optional:  true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  before_destroy :delete_note

  def delete_note
    note = Note.find_by(id: note_id)
    note.destroy
  end
end
