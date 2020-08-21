class AdminsController < ApplicationController

before_action :logged_in_user, only: [:index]
before_action :admin_user ,   only: [:index]



	def index
  	if(params.has_key?(:start_time) && params.has_key?(:end_time))
  	@patient_date_record = Patient.where(
  "created_at >= :start_date AND created_at <= :end_date",
  { start_date: params[:start_time],
    end_date: params[:end_time]}
)

  	@treatment_date_record = Treatment.where(
  "created_at >= :start_date AND created_at <= :end_date",
  { start_date: params[:start_time],
    end_date: params[:end_time]}
)
  	@patient_count_record = @patient_date_record.count
  	@treatment_paid_record = @treatment_date_record.sum(:paid)

  	else
  	@patient_date_record = Patient.all
  	@treatment_date_record = Treatment.all
  	@patient_count_record = Patient.all.count
  	@treatment_count_record = Treatment.all.count
  	@treatment_paid_record = Treatment.all.sum(:paid)
  	@treatment_associate_record = Treatment.all.sum(:associate)
  	@treatment_clinic_record = Treatment.all.sum(:clinic)



   	end
   end

private



     def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  

end
