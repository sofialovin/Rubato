class Lesson < ApplicationRecord
  belongs_to :student
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
end
