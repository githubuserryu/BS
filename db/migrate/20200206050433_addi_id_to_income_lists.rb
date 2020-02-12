class AddiIdToIncomeLists < ActiveRecord::Migration[5.2]
  def change
    add_column :income_lists, :category, :int, null:false
    add_reference :income_lists, :user, null:false, foreign_key: true
  end
end
