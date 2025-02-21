class Clip < ApplicationRecord
  belongs_to :user  # Si chaque clip appartient à un utilisateur
  has_one_attached :video

  validates :title, presence: true
  validates :video, presence: true
end
