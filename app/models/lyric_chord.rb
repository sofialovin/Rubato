class LyricChord < ApplicationRecord
  belongs_to :chord
  belongs_to :lyric
  validates :position, presence: true
end
