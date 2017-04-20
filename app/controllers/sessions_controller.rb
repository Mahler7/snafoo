class SessionsController < ApplicationController
  def create
    employee = Employee.find_by(email: params[:email])
    if employee && employee.authenticate(params[:password])
      session[:employee_id] = employee.id
      flash[:success] = 'Successfully logged in!'
      redirect_to api_v1_suggestions_path
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/login'
    end
  end

  def destroy
    session[:employee_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/login'
  end
end
