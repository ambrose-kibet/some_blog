require 'rails_helper'

RSpec.describe Comment, type: :model do
  # tests go here
  subject { Comment.new(text: 'text', created_at: nil, updated_at: nil, author_id: nil, post_id: nil) }

  before { subject.save }

  it 'should have a test present' do
    subject.text = 'some title'
    expect(subject.text).to be_present
  end

  it 'should have aupdated present' do
    subject.updated_at = '2023-5-17'
    expect(subject.updated_at).to be_present
  end

  it 'should have a post id present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a post id present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end
end
