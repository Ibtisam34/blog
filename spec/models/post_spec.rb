require 'rails_helper'
RSpec.describe Post, type: :model do
  let(:user) do
    User.create(
      name: 'User1',
      photo: 'https://',
      bio: 'developer',
      posts_count: 1
    )
  end
  subject do
    Post.create(
      title: 'Post 1',
      text: 'Hello there',
      author_id: user.id
    )
  end
  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'comments_count should be integer' do
    subject.comments_count = 'string'
    expect(subject).to_not be_valid
  end
  it 'title should be less than or equal to 250 characters' do
    subject.title = 'a' * 252
    expect(subject).to_not be_valid
  end
  it 'comments_count should be greater than or equal to 0' do
    subject.comments_count = -1
    expect(subject).to_not be_valid
  end
  it 'likes_count should be greater than or equal to 0' do
    subject.likes_count = -1
    expect(subject).to_not be_valid
  end
  it 'test update_posts_count method' do
    expect(user.posts_count).to eq(1)
  end
  it 'should not respond to update_posts_count method' do
    expect(subject).to_not respond_to(:update_posts_count)
  end
end
