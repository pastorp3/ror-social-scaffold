# rubocop: disable Layout/LineLength
require 'rails_helper'

RSpec.describe Comment, type: :model do
  User.delete_all
  Post.delete_all

  it '1. FAIL CHECK - Checks if a user can be created' do
    test_c = Comment.create(post_id: nil, user_id: nil, content: nil)
    expect(test_c).to be_invalid
  end

  it '2. SUCCESS CHECK - Checks if a user can be created' do
    User.create(email: 'test2@test.com', name: 'mateo', gravatar_url: 'http://google.com', password: 'this is a password')
    test_u = User.first
    Post.create(content: 'This is a test post', user_id: test_u.id)
    test_p = Post.first
    test_c = Comment.create(post_id: test_p.id, user_id: test_u.id, content: 'this is a test comment')
    expect(test_c).to be_valid
  end
end
# rubocop: enable Layout/LineLength
