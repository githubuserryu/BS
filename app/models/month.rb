class Month < ApplicationRecord
  has_many :income_lists
  has_many :spend_lists

  def month_sum  #月ごとの差額 現状全ての差額
    if $now_m > 0
      income = IncomeList.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month).sum(:income)
      spend = SpendList.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month).sum(:spend)
    else
      income = IncomeList.where(day: "#{$now_y -1 }-#{12 + $now_m }-01".in_time_zone.all_month).sum(:income)
      spend = SpendList.where(day: "#{$now_y -1 }-#{12 + $now_m }-01".in_time_zone.all_month).sum(:spend)
    end
    month = income - spend
  end

end