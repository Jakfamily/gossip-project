class Gossip < ApplicationRecord
  belongs_to :user
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable

  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :content, presence: true, length: { minimum: 10, maximum: 1000 }
end
