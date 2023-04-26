class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def start_work?(attendance)
    return false if attendance.nil?
    !attendance.work_start_time.nil?
  end

  def end_work?(attendance)
    return false if attendance.nil?
    !attendance.work_end_time.nil?
  end
end
