class TopicsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    @topic.posts.build
  end

  def create
    @topic = CreateTopic.new(current_user, topic_params).call
    if @topic.persisted?
      redirect_to topics_path
    else
      render :new
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:subject, posts_attributes: [:id, :content])
  end
end
