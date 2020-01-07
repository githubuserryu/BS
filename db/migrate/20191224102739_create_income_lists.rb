class CreateIncomeLists < ActiveRecord::Migration[5.2]
  def change
    create_table :income_lists do |t|
      t.integer    :income
      t.string     :content
      t.date       :day
      
      t.timestamps
    end
  end
end
