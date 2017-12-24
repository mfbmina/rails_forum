require 'rails_helper'

RSpec.describe CreateTopic do
  let(:user) { create(:user) }
  let(:posts_attributes) { attributes_for(:post) }
  let(:topic_attributes) { attributes_for(:topic).merge(posts_attributes: { "0" => posts_attributes }) }

  subject { CreateTopic.new(user, topic_attributes) }

  describe '#new' do
    it 'should define params' do
      expect(subject.params).to eq(topic_attributes)
    end

    it 'should define user' do
      expect(subject.user).to eq(user)
    end
  end

  describe '#call' do
    context 'with valid user & params' do
      it 'should create a topic' do
        expect { subject.call }.to change { Topic.count }.by(1)
      end

      it 'should create a post' do
        expect { subject.call }.to change { Post.count }.by(1)
      end

      it 'should have a post with the same user as topic' do
        topic = subject.call
        expect(topic.user).to eq(topic.posts.first.user)
      end
    end

    context 'with invalid params' do
      let(:posts_attributes) { {} }

      it 'should not create a topic' do
        expect { subject.call }.to change { Topic.count }.by(0)
      end

      it 'should not create a post' do
        expect { subject.call }.to change { Post.count }.by(0)
      end
    end
  end
end
