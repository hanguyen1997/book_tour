class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end


  def destroy
  	log_out
    redirect_to root_path
  end
end