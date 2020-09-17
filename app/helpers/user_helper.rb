# rubocop: disable Style/GuardClause
module UserHelper
  def send_request(user)
    if current_user.check_friend_request(user.id) == false && current_user.id != user.id
      link_to 'Add as a friend', "/friendship/#{user.id}"
    end
  end

  def accept_request(user)
    link_to 'Accept Friend Request', "/friendship/#{user.id}", method: 'post' if current_user.check_accept_request(user)
  end
end
# rubocop: enable Style/GuardClause
