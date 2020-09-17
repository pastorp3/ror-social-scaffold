module PostsHelper
  def check_the_post(post)
    return post if current_user.friend?(User.find(post.user_id)) || post.user_id == current_user.id

    []
  end
end
