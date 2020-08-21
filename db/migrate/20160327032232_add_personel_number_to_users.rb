class AddPersonelNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :personel_number, :integer
  end
end
