class User < ApplicationRecord
  has_many :clip_likes, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :liked_clips, through: :clip_likes, source: :clip

  def liked?(clip)
    clip_likes.exists?(clip: clip)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [ :username ]

  validates :username, presence: true, uniqueness: { message: "est déjà pris." }
  validates :email, presence: true, uniqueness: { message: "est déjà utilisé." }
  # Assure-toi d'avoir une validation pour la confirmation du mot de passe si nécessaire
  validates :password, length: { minimum: 6 }, on: :create
end
