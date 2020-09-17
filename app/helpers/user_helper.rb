module UserHelper
	def send_request(user)
		link_to 'Add_friend', "/friendship/#{user.id}"  if current_user.check_friend_request(user.id) == false && current_user.id != user.id 

	end

end