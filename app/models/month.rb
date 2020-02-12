class Month < ApplicationRecord
  has_many :income_lists
  has_many :spend_lists

  def month_sum  #月ごとの差額 現状全ての差額
    month = $income_sum - $spend_sum
  end

end