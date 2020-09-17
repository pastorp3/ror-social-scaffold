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

  it '1. FAIL CHECK - Checks if a user can be created' do
    test_u = User.create(email: nil)
    expect(test_u).to be_invalid
  end

  it '2. SUCCESS CHECK - Checks if a user can be created' do
    expect(test_u1).to be_valid
  end

  it '3. Checks for the friendships association' do
    expect(test_u1.friendships).not_to be_nil
  end

  it '4. Checks for the other_friendships association' do
    expect(test_u1.other_friendships).not_to be_nil
  end

  it '5. Checks for the friends_total method - NO FRIENDS' do
    expect(test_u1.total_friends).to be_empty
  end

  it '6. Checks the recieved_friend_request method' do
    expect(test_u1.recieved_friend_request).not_to be_empty
  end

  it '7. Checks the confirm_request method' do
    test_u1.confirm_request(test_u2)
    expect(test_u1.total_friends).not_to be_empty
  end

  it '8. Checks for the friends_total method - WITH FRIENDS' do
    expect(test_u1.total_friends).not_to be_empty
  end

  it '9. Checks the rollback_request method' do
    expect(test_u2.rollback_request(test_u1)).to be true
  end

  it '10. Checks the sent_friends_request method' do
    expect(test_u1.sent_friend_request).not_to be_empty
  end
end
