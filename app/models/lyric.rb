class Lyric < ApplicationRecord
  belongs_to :song
  has_many :lyric_chords, dependent: :destroy
  has_many :chords, through: :lyric_chords
  validates :text, presence: true
end
