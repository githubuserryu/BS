class SpendList < ApplicationRecord
  belongs_to :month, optional: true
  validates :spend, :day, presence: true
end
