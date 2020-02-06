class AddColumnSpendList < ActiveRecord::Migration[5.2]
  def change
    add_column :spend_lists, :category, :int, null:false
    add_reference :spend_lists, :user, null:false, foreign_key: true
  end
end
