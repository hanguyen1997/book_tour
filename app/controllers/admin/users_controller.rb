module Admin
	class UsersController < BaseController
		def index
		  @admin_users = User.all.paginate(page: params[:page], per_page: 10)
		  if !current_user.admin?
			redirect_to admin_root_path
		  end
		end
		 	

		def new
    	  @admin_user = User.new
  		end

  		def create
	      @admin_user = User.new(admin_user)
		  if @admin_user.save
		    flash[:success] = "them thanh cong"
		    redirect_to admin_users_path
		  else
		    render 'new'
		  end
	  	end

	  	def edit
		  @admin_user = User.find(params[:id])
		end

		def update
	      @admin_user = User.find(params[:id])
	      if @admin_user.update_attributes(admin_user)
	        flash[:success] = "da chinh sua thanh cong"
  		    redirect_to admin_users_path
	      else
	        flash[:danger] = "chinh sua that bai"
	        render 'edit'
	      end
		end

	  	def destroy
	      User.find_by(id: params[:id]).destroy
	      flash[:success] = "xoa nguoi dung thanh cong"
	      redirect_to admin_users_path
		end


	  	private

	    def admin_user
	      params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :phone_number, :role)
	    end
	end
end
