class ApplicationController < ActionController::Base
  include Authorizable

  before_action :configure_permitted_params, if: :devise_controller?

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [userable_attributes: [:name]])
    devise_parameter_sanitizer.permit(:account_update, keys: [userable_attributes: [:name]])
  end
end
