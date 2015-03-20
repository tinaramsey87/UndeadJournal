class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        flash[:notice] = "Your post successfully created"
        redirect_to posts_path
      else
        render :new
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:notice] = "You've successfully updated this post"
        redirect_to post_path
      else
        render :edit
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "This post has been permanently destroyed"
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
