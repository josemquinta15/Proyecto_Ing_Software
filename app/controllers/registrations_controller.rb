# frozen_string_literal: true

# Registrations Controller
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_update_path_for(_resource)
    puts 'this is happening yoyo mama'
    flash[:notice] = 'Account succesfully updated'
    home_my_account_path
  end
end
