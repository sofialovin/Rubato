class Note < ApplicationRecord
  belongs_to :lesson
  validates :content, presence: true
end
