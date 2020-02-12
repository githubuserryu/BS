class SpendList < ApplicationRecord
  belongs_to :month, optional: true
  belongs_to :user
  
  validates :spend, :day, presence: true
  validates :spend, :user_id, presence: true

  enum category:{
    "食費":1, "日用品":2, "衣服費":3, "交際費":4, "趣味":5, "美容費":6, "医療費":7, "教育費":8, "交通費":9, "その他":10
  }
end
