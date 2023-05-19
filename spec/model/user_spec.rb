require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  subject { User.new(name: 'Allan', photo: 'https://images.pexels.com/photos/15254467/pexels-photo-15254467/free-photo-of-dj-with-mixer-during-party.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', bio: 'I\'m baby tousled banjo Brooklyn +1 wolf. Affogato taxidermy pinterest, sus selfies mixtape trust fund meditation semiotics skateboard gentrify butcher. Austin yr narwhal artisan coloring book tofu, direct trade cred gatekeep sustainable kickstarter gastropub microdosing unicorn.', posts_counter: 0) }

  before { subject.save }

  it 'should have a name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should be valid with all required attributes' do
    expect(subject).to be_valid
  end

  it 'should have a name present' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
