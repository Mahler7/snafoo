class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_employee
    @current_employee ||= Employee.find_by(id: session[:employee_id]) if session[:employee_id]
  end
  helper_method :current_employee

  def authenticate_employee!
    redirect_to '/login' unless current_employee
  end
end
