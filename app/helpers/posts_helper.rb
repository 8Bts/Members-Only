module PostsHelper
  def author_or_secret(post)
    if user_signed_in?
      post.user.name
    else
      'Secret'
    end  
  end

end
