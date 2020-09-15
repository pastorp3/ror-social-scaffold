require 'rails_helper'

RSpec.describe User, type: :model do
  it 'FAIL CHECK - Checks if a user can be created' do
    test_u = User.create(email: nil)
    expect(test_u).to be_invalid
  end

  it 'SUCCESS CHECK - Checks if a user can be created' do
    test_u = User.new
    test_u.email = 'test@test.com'
    test_u.name = 'pastor'
    test_u.gravatar_url = 'http://google.com'
    test_u.password = 'thisisencrypted'
    test_u.reset_password_token = 'thisisatoken'
    test_u.reset_password_sent_at = Date.today
    test_u.save
    expect(test_u).to be_valid
  end
end
