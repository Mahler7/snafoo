class EmployeesController < ApplicationController
  def create
    employee = Employee.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if employee.save
      session[:employee_id] = employee.id
      flash[:success] = 'Successfully created account!'
      redirect_to api_v1_suggestions_path
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end
end
