module PostsHelper
  def print_the_posts
    # Post.all.each do |post|
    #   #render "post", locals: {post: post} if current_user.friend?(User.find(post.user_id))
    #   link_to 'Accept', "/friendship/1", method: 'post'
    # end
    render @timeline_posts
  end
  
  def check_the_post(post)
    return post if current_user.friend?(User.find(post.user_id)) || post.user_id == current_user.id
    return []
  end
end