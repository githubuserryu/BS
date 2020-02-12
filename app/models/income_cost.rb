class IncomeCost < ApplicationRecord
  belongs_to :user

  validates :income, presence: true
  validates :user_id, presence: true
end
