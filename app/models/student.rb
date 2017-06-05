class Student < ApplicationRecord
  validates :student_id, presence: true, numericality: {greater_than: 0}
  validates :department, presence: true
  validates :maths, presence: true, numericality: {greater_than: -1}
  validates :physics, presence: true, numericality: {greater_than: -1}
  validates :chemistry, presence: true, numericality: {greater_than: -1}
  validates :year, presence: true, numericality: {greater_than: -1}
end
