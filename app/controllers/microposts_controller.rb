class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy
  


    def new
      user = session[:user_id]
      @micropost = Micropost.new()
    end

    def create
      @micropost = Micropost.new(micropost_params)
      @micropost.user_id = session[:user_id]
      @micropost.views_count = 0
      if @micropost.save
        flash[:success] = "Micropost created!"
        redirect_to root_url
      else
        flash[:error] = "Error creating Micropost."
        render new_micropost_path
      end
    end
  
    def destroy
        @micropost.destroy
        flash[:success] = "Micropost deleted"
        redirect_to request.referrer || root_url
    end

    def show
      @micropost = Micropost.find(params[:id])
      views_count = @micropost.views_count + 1
      @micropost.update_attribute(:views_count, views_count)
      @comments = @micropost.comments.paginate(page: params[:page])
    end
  
    private
  
      def micropost_params
        params.require(:micropost).permit(:topic, :title, :content, :views_count, :user_id)
      end

      def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
      end
end