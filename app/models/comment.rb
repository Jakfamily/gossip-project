class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  belongs_to :commentable, polymorphic: true
  has_many :likes, as: :likeable

  validates :content, presence: true, length: { minimum: 5, maximum: 1000 }
end
