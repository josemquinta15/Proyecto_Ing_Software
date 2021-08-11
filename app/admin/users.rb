# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at,
                :last_name, :first_name, :phone, :city, :gender

  menu priority: 2
  # action_item :view, only: :show do
  #   link_to 'View on site', home_my_account_path, :method=>:get
  # end
end
