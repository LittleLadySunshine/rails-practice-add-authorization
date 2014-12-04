class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :logged_in?

  class AccessDenied < StandardError

  end

  def record_not_found
    render "/public/403", status: 403
  end

  def current_student
    Student.find_by_id(session[:student_id])
  end

  helper_method :current_student

  def logged_in?
    unless current_student
      redirect_to login_path
    end
  end

end
