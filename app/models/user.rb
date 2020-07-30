class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :songs
  has_many :students
  has_one_attached :avatar
  validates :first_name, presence: true
  validates :last_name, presence: true
end
