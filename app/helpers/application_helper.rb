module ApplicationHelper
  def is_model?(model)
    model.is_a?(Comment)
  end

  def which_post(post)
    post = Post.find(post)
  end

  def find_post(id)
    Post.find(id)
  end

  def find_comment(id)
    Comment.find(id)
  end
end
