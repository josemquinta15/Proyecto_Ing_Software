# frozen_string_literal: true

ActiveAdmin.register Post do
  belongs_to :user, optional: true

  # navigation_menu :user
  permit_params :text, :title, :price, :level, :date, :user_id, :images
  menu priority: 2
  actions :all
  show do
    attributes_table(:text, :created_at)

    panel I18n.t :missing, default: 'Comments' do
      table_for resource.comments.order(created_at: :desc) do
        column(:user)
        column(:text)
        column(:created_at)
        column(:id)

        column('Comment options') do |comment|
          span link_to 'View', admin_user_comment_path(comment)
          span link_to 'Edit', edit_admin_user_comment_path(comment)
          # span link_to "Delete", delete_admin_user_comment_path(comment)
        end
      end
    end
  end

  action_item :view, only: :show do
    link_to 'View on site', posts_show_path
  end
end
