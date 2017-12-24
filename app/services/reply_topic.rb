class ReplyTopic
  attr_reader :user, :topic, :params

  def initialize(user, topic, params = {})
    @user = user
    @topic = topic
    @params = params
  end

  def call
    post = topic.posts.build(params)
    post.user = user
    post.save
    post
  end
end
