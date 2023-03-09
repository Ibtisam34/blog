require 'rails_helper'

describe Like, type: :model do
  before :each do
    @author = User.new(name: 'Riyana', photo: 'https://', bio: 'Developer')
    @post = Post.new(author: @author, title: 'First', text: 'Post')

    @like = Like.create(author: @author, post: @post)
  end

  it 'test update_likes_counter method ' do
    expect(@post.likes_counter).to eq 1
  end

  it 'Not responde because of private method' do
    expect(@like).to_not respond_to(:update_likes_counter)
  end
end