  module SessionsHelper

  # def log_in(user)
  #   session[:user_id] = user.id
  # end

  # def current_user
  #   if session[:user_id]
  #     @current_user ||= User.find_by(id: session[:user_id])
  #   end
  # end
  
  # def logged_in?
  #   !current_user.nil?
  # end

  def logged_in_as_admin?
    # logged_in? && @current_user.admin?
    user_signed_in? && current_user.admin?
  end

  def logged_in_as_staff?
    user_signed_in? && current_user.role == "staff"
  end

  # def log_out
  #   session.delete(:user_id)
  #   @current_user = nil
  # end
  
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end