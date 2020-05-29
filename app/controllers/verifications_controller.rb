class VerificationsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

    def new
      user = session[:user_id]
      @verification = Verification.new()
    end
       
       
    def create
      @verification = Verification.new(verification_params)
      @verification.user_id = session[:user_id]
      if @verification.save
        flash[:success] = "Verification created!"
        redirect_to current_user
      else
        flash[:error] = "Error creating verification."
      end
    end


  private

    def verification_params
      params.require(:verification).permit(:cardtype, :cardnumber, :picture, :user_id)
    end
end
