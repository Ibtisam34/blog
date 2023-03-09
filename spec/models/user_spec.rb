require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Riyana', photo: 'https://', posts_counter: 10, bio: 'Developer') }

  before { subject.save }

  it 'Name should exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post Counter must be integer' do
    subject.posts_counter = 'z'
    expect(subject).to_not be_valid
  end

  it 'Post Counter must be greater than 0' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end
end
