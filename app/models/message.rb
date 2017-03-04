class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  scope :order_by_desc, -> { order(created_at: :desc) }

  validates :text, :group_id, :user_id, presence: true
end
