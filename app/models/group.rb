class Group < ApplicationRecord
  validates :name, presence: true

  has_many :users, through: :chat_groups
  has_many :chat_groups
end
