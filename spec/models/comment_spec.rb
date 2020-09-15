require 'rails_helper'

RSpec.describe Comment, type: :model do
  test_u = User.create(email: 'test2@test.com', name: 'mateo', gravatar_url: 'http://google.com')
  test_u = User.first
  test_p = Post.create(content: 'This is a test post', user_id: test_u.id)
  test_p = Post.first

  it 'FAIL CHECK - Checks if a user can be created' do
    test_c = Comment.create(post_id: nil, user_id: nil, content: nil)
    expect(test_c).to be_invalid
  end

  it 'SUCCESS CHECK - Checks if a user can be created' do
    test_c = Comment.create(post_id: test_p.id, user_id: test_u.id, content: 'this is a test comment')
    expect(test_c).to be_valid
  end
end
