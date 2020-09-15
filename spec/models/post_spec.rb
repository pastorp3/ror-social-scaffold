require 'rails_helper'

RSpec.describe Post, type: :model do
  test_u = User.create(email: 'test2@test.com', name: 'mateo', gravatar_url: 'http://google.com')
  test_u.email =
    test_u.name = 'pastor'
  test_u.gravatar_url = 'http://google.com'
  it 'FAIL CHECK - Checks if a user can be created' do
    test_p = Post.create(content: nil, user_id: nil)
    expect(test_p).to be_invalid
  end

  it 'SUCCESS CHECK - Checks if a user can be created' do
    test_p = Post.create(content: 'This is a test post', user_id: test_u.id)
    expect(test_p).to be_valid
  end
end
