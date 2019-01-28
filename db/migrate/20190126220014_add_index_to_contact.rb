class AddIndexToContact < ActiveRecord::Migration[5.2]
  def change
    add_index :contacts, [:case_id, :caserole], unique: true
  end
end
