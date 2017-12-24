module ApplicationHelper
  def topic_author?(topic)
    current_user == topic.user
  end

  def post_author?(post)
    current_user == post.user
  end
end
