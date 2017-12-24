class TopicsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :find_topic, except: [:index, :new, :create]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    @topic.posts.build
  end

  def show
  end

  def edit
  end

  def create
    @topic = CreateTopic.new(current_user, topic_params).call
    if @topic.persisted?
      redirect_to topics_path
    else
      render :new
    end
  end

  def update
    if @topic.update_attributes(topic_params)
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    if @topic.destroy
      redirect_to topics_path
    else
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:subject, posts_attributes: [:id, :content])
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end
end
