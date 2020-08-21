class AddTreatmentRefToPatients < ActiveRecord::Migration
  def change
    add_reference :patients, :treatment, index: true, foreign_key: true
  end
end
