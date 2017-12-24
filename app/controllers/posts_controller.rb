class PostsController < ApplicationController
  before_action :find_topic
  before_action :find_post, except: :create

  def edit
  end

  def create
    post = ReplyTopic.new(current_user, @topic, post_params).call
    if post.persisted?
      redirect_to topic_path(@topic), notice: 'Topic replied successfully.'
    else
      flash.now[:alert] = 'Error replying this topic.'
      render 'topics/show'
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to topic_path(@topic), notice: 'Post updated successfully.'
    else
      flash.now[:alert] = 'Error updating this post.'
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to topic_path(@topic), notice: 'Post deleted successfully.'
    else
      flash.now[:alert] = 'Error deleting this post.'
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

  def find_post
    @post = @topic.posts.find(params[:id])
  end
end
