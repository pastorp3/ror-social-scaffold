require 'rails_helper'

RSpec.describe Like, type: :model do
  test_u = User.create(email: 'test2@test.com', name: 'mateo', gravatar_url: 'http://google.com')
  test_p = Post.create(content: 'This is a test post', user_id: test_u.id)

  it 'FAIL CHECK - Checks if a user can be created' do
    test_l = Like.create(post_id: nil, user_id: nil)
    expect(test_l).to be_invalid
  end

  it 'SUCCESS CHECK - Checks if a user can be created' do
    test_l = Like.create(post_id: test_p.id, user_id: test_u.id)
    expect(test_l).to be_valid
  end
end