class Patient < ActiveRecord::Base
	
	belongs_to :user
	has_many :treatments

  
  has_attached_file :patient_avatar, styles: { large: "150x150>", medium: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :patient_avatar, content_type: /\Aimage\/.*\Z/

  has_attached_file :patient_od, styles: { large: "150x150>", medium: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :patient_avatar, content_type: /\Aimage\/.*\Z/


  def self.search(search, first_name, last_name, id)
    where('first_name LIKE ? OR last_name LIKE ? OR id LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
   
    end


end