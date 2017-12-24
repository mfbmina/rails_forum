class CreateTopic
  attr_reader :user, :params

  def initialize(user, params = {})
    @user = user
    @params = params
  end

  def call
    topic = @user.topics.build(params)
    topic.posts.first.user = user
    topic.save
    topic
  end
end
