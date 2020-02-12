class CreateSpendCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :spend_costs do |t|
      t.integer    :spend, null:false
      t.string     :content
      t.integer    :user_id, null:false, foreign_key: true

      t.timestamps
    end
  end
end
