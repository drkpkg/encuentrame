class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  respond_to :html

  private

  def current_user
    begin
      @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id]).id.to_s
    rescue
      @_current_user = nil
    end
  end

  def verify_user
    begin
      session[:current_user_id] = cookies.signed[:session]["$oid"]
    rescue
      cookies.delete(:session)
      session[:current_user_id] = nil
      redirect_to root_path
    end
  end
end
