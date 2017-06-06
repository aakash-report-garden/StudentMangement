class Student < ApplicationRecord

  belongs_to :college

  validates :student_id, presence: true, numericality: {greater_than: 0}
  validates :department, presence: true
  validates :maths, presence: true, numericality: {greater_than: -1}
  validates :physics, presence: true, numericality: {greater_than: -1}
  validates :chemistry, presence: true, numericality: {greater_than: -1}
  validates :year, presence: true, numericality: {greater_than: -1}

  before_save :update_extended_sid

  private
  def update_extended_sid
    self.extended_sid = self.student_id.to_s + self.college.name[0,2]
  end
end
