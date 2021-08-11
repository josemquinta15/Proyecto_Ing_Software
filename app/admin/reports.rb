# frozen_string_literal: true

ActiveAdmin.register Report do
  menu priority: 1
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :author_id, :text, :post_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :author_id, :text, :post_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
