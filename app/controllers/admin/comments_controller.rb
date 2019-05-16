module Admin
	class CommentsController < BaseController
		def index
			 @admin_comments = Review.all.paginate(page: params[:page], per_page: 10)
		end

		def destroy
		    Review.find_by(id: params[:id]).destroy
		    flash[:success] = "xoa binh luan"
		    redirect_to admin_comments_path
		end

		private

		    def admin_category
		      params.require(:category).permit(:name)
		    end

	end
end
