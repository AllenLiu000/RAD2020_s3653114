class AvatarsController < ApplicationController
    def new
    end
  
    def create
    end
  
    def edit
      @user= User.find(session[:user_id])
    end
  
end