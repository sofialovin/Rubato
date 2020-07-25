class Audio < ApplicationRecord
  belongs_to :song
  validates :url, presence: true
end
