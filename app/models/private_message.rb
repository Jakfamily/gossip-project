class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  validates :content, presence: true, length: { minimum: 5, maximum: 1000 }
end
