class CommentsController < ApplicationController

  def create
  	@comment = Comment.new comment_params
    if @comment.save
      redirect_to root_path
    else
      flash[:success] = "binh luan khong thanh cong"
      redirect_to root_path
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :review_id , :content)
    end
  
  
end
