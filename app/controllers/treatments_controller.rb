class TreatmentsController < ApplicationController
  
before_action :logged_in_user, only: [:new, :edit, :update, :destroy, :create, :show]
before_action :admin_user ,   only: [:new, :show, :edit, :update , :create, :destroy]

  def new
  	@treat = Treatment.new
  end

  def create	
  	
  	
  	@treat = Treatment.new(treat_params)

  	if @treat.save
      flash[:success] = "new treatment added"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @treatment = Treatment.find(params[:id])
  end

 

  def update
    @treatment = Treatment.find(params[:id])
    if @treatment.update_attributes(treat_params)
      flash[:success] = "Record information Updated"
      redirect_to edit_treatment_path
    else
      render 'edit'
    end
  end

  def destroy

    Treatment.find(params[:id]).destroy
    flash[:success] = "Treatment record has been deleted"
    redirect_to root_path
    
  end

  def show
  
  @treatment = Treatment.find(params[:id])

  end


  private

  def treat_params
	      params.require(:treatment).permit(:teartment_date,:tooth_number,:remark,:fee,:paid,:balance,:associate,
	      	:clinic, :patient_id,:patient_xray)
	    end

          # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

     def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end



