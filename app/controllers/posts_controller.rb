class PostsController < ApplicationController
  before_action :find_topic

  def create
    post = ReplyTopic.new(current_user, @topic, post_params).call
    if post.persisted?
      redirect_to topic_path(@topic)
    else
      render 'topics/show'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end
end
