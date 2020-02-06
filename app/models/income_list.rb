class IncomeList < ApplicationRecord
  belongs_to :month, optional: true
  belongs_to :user
  validates :income, :day, presence: true
  validates :income, :user_id, presence: true

  enum category:{
    "給料":1, "財形貯蓄":2, "投資":3, "臨時収入":4, "その他":5
  }
end
