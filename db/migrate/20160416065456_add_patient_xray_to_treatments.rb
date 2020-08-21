class AddPatientXrayToTreatments < ActiveRecord::Migration
  def self.up
    change_table :treatments do |t|
      t.attachment :patient_xray
    end
  end

  def self.down
    remove_attachment :treatments, :patient_xray
  end
end
