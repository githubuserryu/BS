class Month < ApplicationRecord
  has_many :income_lists
  has_many :spend_lists

  def month_sum  #月ごとの差額 現状全ての差額
    # current_user_list
    # if $now_m > 0
    #   income = @user_income.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month).sum(:income)
    #   spend = @user_spend.where(day: "#{$now_y}-#{$now_m}-01".in_time_zone.all_month).sum(:spend)
    # else
    #   income = @user_income.where(day: "#{$now_y -1 }-#{12 + $now_m }-01".in_time_zone.all_month).sum(:income)
    #   spend = @user_spend.where(day: "#{$now_y -1 }-#{12 + $now_m }-01".in_time_zone.all_month).sum(:spend)
    # end
    month = $income_sum - $spend_sum
  end

  # def current_user_list
  #   @user_income = IncomeList.where(user_id: current_user.id)
  #   @user_spend = SpendList.where(user_id: current_user.id)
  # end

end