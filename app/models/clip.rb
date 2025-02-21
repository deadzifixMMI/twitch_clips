class Clip < ApplicationRecord
  belongs_to :user  # Si chaque clip appartient à un utilisateur
  has_one_attached :video
  has_many :clip_likes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :clip_likes, source: :user

  # Met à jour les likes_count à chaque ajout ou suppression de like
  def update_likes_count
    update(likes_count: likes.count)
  end

  validates :title, presence: true
  validates :video, presence: true
end
