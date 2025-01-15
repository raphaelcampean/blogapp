module CommentsHelper
  def comment_model(comment)
    comment = Comment.find(comment)
  end
end
