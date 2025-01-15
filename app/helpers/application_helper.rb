module ApplicationHelper
  def is_model?(model)
    model.is_a?(Comment)
  end

  def which_post(post)
    post = Post.find(post)
  end
end
