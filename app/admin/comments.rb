# frozen_string_literal: true

ActiveAdmin.register Comment, as: 'User Comments' do
  # belongs_to :user, optional: true
  belongs_to :post, optional: true

  menu priority: 5
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  permit_params :text, :date, :comment_type, :user_id, :post_id

  # actions :all, except: [:update]

  # or
  #
  # permit_params do
  #   permitted = [:text, :date, :comment_type, :user_id, :post_id, :father_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
