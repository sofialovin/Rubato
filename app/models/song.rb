class Song < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :lyrics, dependent: :destroy
  has_many :lyric_chords, through: :lyrics
  has_many :chords, through: :lyric_chords
  has_many :audios, dependent: :destroy
  has_many :student_songs, dependent: :destroy
  has_many :students, through: :student_songs
  validates :name, presence: true, uniqueness: true
  validates :skill_level, inclusion: { in: %w(Beginner Intermediate Advanced),
    message: "Skill level should be Beginner, Intermediate or Advanced" }
end
