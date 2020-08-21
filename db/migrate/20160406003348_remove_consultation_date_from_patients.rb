class RemoveConsultationDateFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :consultation_date, :datetime
  end
end
