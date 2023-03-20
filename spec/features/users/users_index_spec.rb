require 'rails_helper'
RSpec.describe 'Users Index Page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Lily', photo: 'https://unsplash.com/photos/F_-0BxGuVvo'
                         bio: 'Teacher from New York.')
    @user2 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from maxico.')
    @post_one = Post.create(author: @user1, title: 'Intro', body: 'This is my first post')
    @post_two = Post.create(author: @user2, title: 'Promo', body: 'hello ya`ll!')
  end
  scenario 'display all users names' do
    visit '/'
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end
  scenario 'display post counter' do
    visit '/'
    expect(page).to have_content(@user1.posts_counter)
  end
  scenario 'display user picture' do
    visit '/'
    expect(page).to have_css('img')
  end
  scenario 'shows post show page when it\'s clicked' do
    visit '/'
    click_link(@user1.name)
    expect(page).to have_current_path(user_path(id: @user1.id))
  end
end
