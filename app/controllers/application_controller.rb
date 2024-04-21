class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_last_name, :second_last_name, :phone, :birth, :gender_id, :origen_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :first_last_name, :second_last_name, :birth, :phone, :gender_id, :origen_id])
  end
end
