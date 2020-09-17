require 'rails_helper'


RSpec.describe User, type: :model do
  User.delete_all
  Friendship.delete_all
  User.create(email: 'test2@test.com', name: 'mateo', gravatar_url: 'http://google.com', password: 'this is a password')
  test_u1 = User.first
  User.create(email: 'test@test.com', name: 'pastor', gravatar_url: 'http://google.com', password: 'this is a password')
  test_u2 = User.last
  Friendship.create(user_id: test_u1.id, friend_id: test_u2.id, status: false)
  Friendship.create(user_id: test_u2.id, friend_id: test_u1.id, status: false)

  it 'FAIL CHECK - Checks if a user can be created' do
    test_u = User.create(email: nil)
    expect(test_u).to be_invalid
  end

  it 'SUCCESS CHECK - Checks if a user can be created' do
    expect(test_u1).to be_valid
  end

  it 'Checks for the friendships association' do
    expect(test_u1.friendships).not_to be_nil
  end

  it 'Checks for the other_friendships association' do
    expect(test_u1.other_friendships).not_to be_nil
  end

  it 'Checks for the friends_total method - NO FRIENDS' do
    expect(test_u1.total_friends).to be_empty
  end

  it 'Checks the recieved_friend_request method' do
    expect(test_u1.recieved_friend_request).not_to be_empty
  end

  it 'Checks the confirm_request method' do
    test_u1.confirm_request(test_u2.id)
    expect(test_u1.total_friends).not_to be_empty
  end

  it 'Checks for the friends_total method - WITH FRIENDS' do
    expect(test_u1.total_friends).not_to be_empty
  end

  it 'Checks the rollback_request method' do
    expect(test_u2.rollback_request(test_u1.id)).to be true
  end

  it 'Checks the sent_friends_request method' do
    expect(test_u1.sent_friends_request).not_to be_empty
  end
end
