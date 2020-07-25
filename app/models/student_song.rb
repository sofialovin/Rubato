class StudentSong < ApplicationRecord
  belongs_to :song
  belongs_to :student
end
