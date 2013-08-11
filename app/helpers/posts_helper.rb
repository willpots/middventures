module PostsHelper


  def post_to_twitter post
    Twitter.update(post.title + " - Read at http://www.middventures.com/posts/" + post.id.to_s)
  end
end
