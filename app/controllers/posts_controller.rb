class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end  

  def create
    @post = Post.new(params[:post])
    if @post.save

      redirect_to @post
    else
      render :new
    end  
  end  
end
