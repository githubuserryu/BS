class RemoveUserIdtoIncomeCost < ActiveRecord::Migration[5.2]
  def change
    remove_column :income_costs, :user_id, :integer
  end
end
