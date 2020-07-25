class Teacher < ApplicationRecord
  has_many :songs
  has_many :students
  validates :first_name, presence: true
  validates :last_name, presence: true
end
