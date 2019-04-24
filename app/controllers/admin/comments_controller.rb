module Admin
	class CommentsController < BaseController
		def index
			 @admin_comments = Comment.all.paginate(page: params[:page], per_page: 10)
		end
	end
end
