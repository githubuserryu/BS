class IncomeList < ApplicationRecord
  belongs_to :month, optional: true
  validates :income, :day, presence: true
  
  # belong_to :user
  # belong_to :month
end
