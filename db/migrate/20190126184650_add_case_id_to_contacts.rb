class AddCaseIdToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :case_id, :integer
  end
end
