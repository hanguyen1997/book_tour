class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash.now[:notice] = 'Xin Chao Den Viet Travel' # Not quite right!
      check_admin user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end


  def destroy
  	destroy_user_session_path
    redirect_to root_path
  end

   private

    def check_admin user
      user.admin? || user.role == "staff" ? redirect_to(admin_root_url) : redirect_back_or(root_url)
    end
end