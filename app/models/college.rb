class College < ApplicationRecord
  validates :name, presence: true
  validates :established_year, presence: true, numericality: {greater_than: 0}
end
