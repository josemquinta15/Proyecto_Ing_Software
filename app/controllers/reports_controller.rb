# frozen_string_literal: true

# comment
class ReportsController < InheritedResources::Base
  before_action :get_post # , except: [:show]
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @report = @post.reports
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = @post.reports.build
  end

  def create
    @report_params = params.require(:report).permit(:text, :author_id, :user_id, :post_id)
    p @report_params

    @report = @post.reports.build(@report_params)

    @report.author_id = @post.user_id
    @report.user_id = current_user.id

    @report.text = 'Nara' if @report.text.empty?

    p @report

    if @report.save
      redirect_to posts_show_path(@post), notice: 'A new report has been created!'
    else
      redirect_to posts_show_path(@post), notice: 'Error!'
    end
  end

  def edit; end

  # def update
  #   @report = Report.find_by(id: params[:id])
  #   @report_params = params.require(:report).permit(:text, :author_id, :user_id, :post_id)

  #   if @report.update(@report_params)

  #     redirect_to posts_index_path, notice: 'REPORT has been edited'
  #   else
  #     redirect_to posts_index_path, notice: 'Error!'
  #   end
  # end

  def delete
    @report = Report.find_by(id: params[:id])
    @report.destroy
    redirect_to posts_index_path, notice: 'Report deleted'
  end

  def correct_user
    @report = current_user.reports.find_by(id: params[:id])
    redirect_to posts_index_path, notice: 'You are not Authorized' if @report.nil?
  end

  def get_post
    @post = Post.find(params[:post_id])
  end

  def set_report
    @report = @post.reports.find(params[:id])
  end
end
