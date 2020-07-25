class Chord < ApplicationRecord
  has_many :lyric_chords
  has_many :lyrics, through: :lyric_chords
  validates :name, presence: true
  # validates :name, uniqueness: true
end
