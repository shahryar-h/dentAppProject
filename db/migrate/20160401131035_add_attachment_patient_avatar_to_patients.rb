class AddAttachmentPatientAvatarToPatients < ActiveRecord::Migration
  def self.up
    change_table :patients do |t|
      t.attachment :patient_avatar
    end
  end

  def self.down
    remove_attachment :patients, :patient_avatar
  end
end
