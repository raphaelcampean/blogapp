class CommentsController < ApplicationController
  before_action :set_post, only: %i[]

  def index
  end

  def show
  end

  def new
    @comment = Comment.new

    respond_to do |format|
      format.turbo_stream
    end
  end

  def create
    @commentable = params[:comment][:commentable_type].constantize.find(params[:comment][:commentable_id])

    @comment = Comment.new(create_params)
    @comment.commentable = @commentable
    @comment.parent_id = params[:comment][:parent_id]
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.html { redirect_to @commentable, notice: 'Comentário criado com sucesso.' }
        format.turbo_stream
      end
    else
      redirect_to post_path(@comment.post_id), alert: 'Erro ao criar comentário.'
    end
  end

  def destroy
  end

  def update
  end

  private

  def set_post
    @post = Post.find(params[:comment][:commentable_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :post_id)
  end

  def create_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :parent_id, :post_id)
  end

  def find_commentable
    params[:comment][:commentable_type].constantize.find(params[:commentable_id])
  end
end
