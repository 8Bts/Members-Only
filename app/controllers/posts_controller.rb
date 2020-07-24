class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save

      redirect_to posts_path
    else
      flash[:notice] = 'you have problems'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
