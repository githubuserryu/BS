class AddUserToSpendCost < ActiveRecord::Migration[5.2]
  def change
    add_reference :spend_costs, :user, foreign_key: true
  end
end
