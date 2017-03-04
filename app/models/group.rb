class Group < ApplicationRecord
  validates :name, presence: true

  has_many :users, through: :chat_groups
  has_many :chat_groups

  accepts_nested_attributes_for :chat_groups

  scope :order_by_desc, -> { order(created_at: :desc) }
end
