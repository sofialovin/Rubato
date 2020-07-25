class Student < ApplicationRecord
  belongs_to :user
  has_many :student_songs, dependent: :destroy
  has_many :songs, through: :student_songs
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :skill_level, inclusion: { in: %w(beginner intermediate advanced),
    message: "Skill level should be beginner, intermediate or advanced" }
end
