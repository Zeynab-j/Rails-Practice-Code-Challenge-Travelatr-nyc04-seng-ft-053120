class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @bloggers = Blogger.all
    @destinations = Destination.all
    @post = Post.new
  end

  def create
    @bloggers = Blogger.all
    @destinations = Destination.all
    @post = Post.new(posts_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @bloggers = Blogger.all
    @destinations = Destination.all
    @post = Post.find(params[:id])
  end

  def update
    @bloggers = Blogger.all
    @destinations = Destination.all
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def like
    @post = Post.find(params[:id])
    new_likes_count = @post.likes + 1
    @post.update(likes: new_likes_count)
    redirect_to @post
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end
end
