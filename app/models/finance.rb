class Finance < ApplicationRecord
  has_many :persons_finances
  has_many :people, through: :persons_finances

  def destroy
    person.each do |person|
      return false if person.finance.count == 1
    end
    super
  end
end
