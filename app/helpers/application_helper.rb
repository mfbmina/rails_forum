module ApplicationHelper
  def topic_author?(topic)
    current_user == topic.user
  end

  def post_author?(post)
    current_user == post.user
  end

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
      when :alert
        "alert-danger"
      when :notice
        "alert-success"
      else
        flash_type.to_s
    end
  end
end
