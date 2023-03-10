require 'rails_helper'

RSpec.describe Post, type: :model do
  user1 = User.create(name: 'Riyana', photo: 'https://www.shutterstock.com/image-vector/open-book-vector-clipart-silhouette-260nw-795305758.jpg',
                      bio: 'Student from Somaliya.')
  subject do
    Post.new(title: 'My post', body: 'Hello! My name is Queen Riyana.', author: user1, comments_counter: 1,
             likes_counter: 2)
  end

  before { user1.save }
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'likes counter should be an integer' do
    subject.likes_counter = 'a'
    expect(subject).to_not be_valid
  end
end
