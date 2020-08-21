class Treatment < ActiveRecord::Base
  	has_one :user, through: :patient
    belongs_to :patient
    validates :patient_id,  presence: true
      has_attached_file :patient_xray, styles: { large: "150x150>", medium: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :patient_xray, content_type: /\Aimage\/.*\Z/

  
  
end
