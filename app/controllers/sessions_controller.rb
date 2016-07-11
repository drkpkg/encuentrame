class SessionsController < ApplicationController

  include BCrypt
  layout 'login'

  def login
    if current_user
      redirect_to dashboard_path
    end
  end

  def create
    if params[:session][:email].blank? or params[:session][:password].blank?
      redirect_to login_path, notice: "Campos en blanco"
    else
      begin
        @user = User.find_by(email: params[:session][:email])
        case @user.password_is_valid?(params[:session][:password])
          when true
            session[:current_user_id] = @user.id.to_s
            case params[:session][:persistent_login]
              when '0'
                cookies.signed[:session] = @user.id
              when '1'
                cookies.permanent.signed[:session] = @user.id
            end
            redirect_to dashboard_path
          else
            redirect_to login_path, notice: "Por favor verifica tus datos"
        end
      rescue
        redirect_to login_path, notice: "Por favor verifica tus datos"
      end
    end
  end

  def logout
    @_current_user = session[:current_user_id] = nil
    cookies.delete :session
    redirect_to root_url
  end

  private
  def verify_type
    if @user.user_type == 'client'
      redirect_to root_path
    end
  end

end
