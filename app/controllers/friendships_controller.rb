class FriendshipsController < ApplicationController
  def add_friend
    userid = current_user.id
    newfriend = Friendship.new(user_id: userid, friend_id: params[:id], status: false)
    newfriend.save
    redirect_to users_path
  end

  def accept
    current_user.confirm_request(User.find(params[:id]))
    redirect_to users_path
  end

  def cancel_request
    friend = Friendship.where(user_id: current_user.id, friend_id: params[:id])
    friend[0].destroy unless friend.empty?

    friend = Friendship.where(user_id: params[:id], friend_id: current_user.id)
    friend[0].destroy unless friend.empty?
    redirect_to users_path
  end
end
