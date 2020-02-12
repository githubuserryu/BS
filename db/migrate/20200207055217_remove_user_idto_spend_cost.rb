class RemoveUserIdtoSpendCost < ActiveRecord::Migration[5.2]
  def change
    remove_column :spend_costs, :user_id, :integer
  end
end
