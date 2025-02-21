class User < ApplicationRecord
  has_many :clips, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  authentication_keys: [ :username ]

  validates :username, presence: true, uniqueness: true
end
