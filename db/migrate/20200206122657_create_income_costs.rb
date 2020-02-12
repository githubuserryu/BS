class CreateIncomeCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :income_costs do |t|
      t.integer    :income, null:false
      t.string     :content
      t.integer    :user_id, null:false, foreign_key: true
      
      t.timestamps
    end
  end
end
