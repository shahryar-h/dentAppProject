class RemoveContactNumberFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :contact_number, :integer
  end
end
