require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Riyana', photo: 'https://www.shutterstock.com/image-vector/open-book-vector-clipart-silhouette-260nw-795305758.jpg',
                        bio: 'Student from Somaliya.')
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post counter should be integer' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end
end
