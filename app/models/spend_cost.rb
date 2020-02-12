class SpendCost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :spend, presence: true
end
