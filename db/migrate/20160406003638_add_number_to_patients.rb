class AddNumberToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :con_number, :string
    add_column :patients, :consult_date, :date
  end
end
