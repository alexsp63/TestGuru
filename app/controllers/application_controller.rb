class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    attributes = %i[username first_name second_name]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  def after_sign_in_path_for(_resource)
    flash[:notice] = "Привет, #{current_user.first_name} #{current_user.second_name}!"
    current_user.is_a?(Admin) ? admin_tests_path : tests_path
  end
end
