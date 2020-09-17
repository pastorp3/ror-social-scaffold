class FriendshipsController < ApplicationController
	def Add_friend
		 userid = current_user.id
		 newfriend = Friendship.new(user_id: userid, friend_id: params[:id], status: false)
		 newfriend.save
		 redirect_to users_path
	end

	def Accept
		redirect_to 'https://google.com'
	end
end
