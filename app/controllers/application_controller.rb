class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  def is_login?
    unless current_user
      respond_to do |format|
        format.html {
          flash[:error] = "Please login"
          redirect_to '/'
        }
        format.json {
          output_hash = {
              message: "You are not logged in",
              login_required: true,
              status: "Fail"
          }
          render json: output_hash
        }
      end
    end
  end

end
