class Tag < ApplicationRecord
  has_many :gossip_tags
  has_many :gossips, through: :gossip_tags
  
  validates :title, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: { case_sensitive: false }
end
