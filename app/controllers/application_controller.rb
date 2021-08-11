# frozen_string_literal: true

# Aplication Controller
class ApplicationController < ActionController::Base
  before_action :configure_permited_parameters, if: :devise_controller?

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone city gender avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name phone city gender avatar])
  end
end
