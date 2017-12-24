module ApplicationHelper
  def topic_author?
    current_user == @topic.user
  end
end
