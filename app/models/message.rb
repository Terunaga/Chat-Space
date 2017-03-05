class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :text, :group_id, :user_id, presence: true
end
