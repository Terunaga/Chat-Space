class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  scope :order_by_desc, -> { order(created_at: :desc) }

  validates :text, presence: true
end
