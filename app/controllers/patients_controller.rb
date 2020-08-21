class PatientsController < ApplicationController
  before_action :logged_in_user, only: [:new,:index, :edit, :update, :show, :destroy, :create]

	   def new

    @patient= Patient.new
    
    

  	end


  	def show

  		@patient = Patient.find(params[:id])

  	end

    def index
    
    if params[:search]
      @patients = Patient.all.search(params[:search], params[:first_name], params[:last_name], params[:id]).paginate(page: params[:page],:per_page => 6)
    elsif params[:search].blank?
       @patients = Patient.all.paginate(page: params[:page],:per_page => 6)
    elsif params[:search].nill?
       @patients = Patient.all.paginate(page: params[:page],:per_page => 6)

        
    end

    end


	def create
    
    
      @patient = Patient.new(patient_params)
    
    if @patient.save!
      flash[:success] = "new patient added"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def edit
    @patient = Patient.find(params[:id])
   
  end
  
  def update
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(patient_params)
      flash[:success] = "Patient information Updated"
      redirect_to patient_path
    else
      render 'edit'
    end
  end

    def destroy
    Patient.find(params[:id]).destroy
    flash[:success] = "Patient deleted"
    redirect_to root_path
  end


	private


      def patient_params
        
        params.require(:patient).permit(:first_name, :last_name, :middle_name, :patient_number, :title, :birtday,
                     :address, :con_number, :diagnosis, :consult_date, :guardian, :physician,:patient_avatar,:patient_od, :user_id)
      end

      def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url
      end
    end



end
