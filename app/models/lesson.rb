class Lesson < ApplicationRecord
  belongs_to :student
  has_one :note
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
end
