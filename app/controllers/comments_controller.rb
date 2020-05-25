class CommentsController < ApplicationController

    def index
        @comment = Comment.all 
      end
    
      def new
        user = session[:user_id]
        @comment = Comment.new(micropost_id: params[:micropost_id])
        @micropost = Micropost.find(params[:micropost_id])
      end
    
      def create
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]
        if @comment.save
          flash[:notice] = "comment created."
          redirect_to root_url
        else
          flash[:error] = "Error creating comment."
        end
      end

    
       private
    
       def comment_params
            params.require(:comment).permit(:content, :user_id, :micropost_id)
       end
end
