# frozen_string_literal: true

ActiveAdmin.register AnimalRequest do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :animal, :message
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :animal, :message]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
