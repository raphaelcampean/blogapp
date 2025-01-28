class Admin::ReportsController < ApplicationController
  before_action :set_comment, only: %i[new create]

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(create_params)
    @report.comment = @comment
    @report.user = current_user

    if @report.save
      redirect_to posts_path(@comment.post_id), alert: 'Denúncia criada com sucesso.'
    else
      redirect_to posts_path(@comment.post_id), alert: 'Erro ao criar denúncia.'
    end
  end

  def index
    @reports = Report.all
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def create_params
    params.require(:report).permit(:reason, :comment_id, :user_id)
  end
end
