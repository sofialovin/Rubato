class Student < ApplicationRecord
  belongs_to :user
  has_many :student_songs, dependent: :destroy
  has_many :songs, through: :student_songs
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :skill_level, inclusion: { in: %w(Beginner Intermediate Advanced),
    message: "should be Beginner, Intermediate or Advanced" }
end
