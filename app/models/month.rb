class Month < ApplicationRecord
  has_many :income_lists
  has_many :spend_lists

  def month_sum  #月ごとの差額 現状全ての差額
    income = IncomeList.where(day: "#{$y}-#{$m}-01".in_time_zone.all_month).sum(:income)
    spend = SpendList.where(day: "#{$y}-#{$m}-01".in_time_zone.all_month).sum(:spend)
    # group("MONTH(day)")
    month = income - spend
  end
end
