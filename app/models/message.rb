class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  scope :order_by_asc, -> { order(created_at: :asc) }

  validates :text, :group_id, :user_id, presence: true
end
