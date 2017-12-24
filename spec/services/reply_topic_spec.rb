require 'rails_helper'

RSpec.describe ReplyTopic do
  let(:user) { create(:user) }
  let(:topic) { create(:topic) }
  let(:posts_attributes) { attributes_for(:post) }

  subject { ReplyTopic.new(user, topic, posts_attributes) }

  describe '#new' do
    it 'should define params' do
      expect(subject.params).to eq(posts_attributes)
    end

    it 'should define topic' do
      expect(subject.topic).to eq(topic)
    end

    it 'should define user' do
      expect(subject.user).to eq(user)
    end
  end

  describe '#call' do
    context 'with valid user & params' do
      it 'should create a post' do
        expect { subject.call }.to change { Post.count }.by(1)
      end

      it 'should have post user with the given user' do
        expect(subject.call.user).to eq(user)
      end
    end

    context 'with invalid params' do
      let(:posts_attributes) { {} }

      it 'should not create a post' do
        expect { subject.call }.to change { Post.count }.by(0)
      end
    end
  end
end
