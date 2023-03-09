require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comments_count' do
    it 'increments the comments_count of the associated post' do
      user = User.create(name: 'Riyana', photo: 'https://', bio: 'Developer')
      post = Post.create(title: 'Post', text: 'Hello there', author: user)
      comment = Comment.create(text: 'Nice post', author: user, post: post)
      expect { comment.update(text: 'Great post!') }.to change { post.reload.comments_counter }.by(1)
    end
  end
end
