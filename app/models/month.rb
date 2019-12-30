class Month < ApplicationRecord
  has_many :income_lists
  has_many :spend_lists

  def month_sum  #月ごとの差額 現状全ての差額
    income = IncomeList.sum(:income)
    spend = SpendList.all.sum(:spend)
    # group("MONTH(day)")
    month = income - spend
  end
end
