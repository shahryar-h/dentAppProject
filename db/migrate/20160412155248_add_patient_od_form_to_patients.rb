class AddPatientOdFormToPatients < ActiveRecord::Migration
  def self.up
    change_table :patients do |t|
      t.attachment :patient_od
    end
  end

  def self.down
    remove_attachment :patients, :patient_od
  end
end
