class CreateSpendLists < ActiveRecord::Migration[5.2]
  def change
    create_table :spend_lists do |t|
      t.integer  :spend
      t.date    :day
      t.string  :use

      t.timestamps
    end
  end
end
