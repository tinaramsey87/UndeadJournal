class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
      if @comment.save
        flash[:notice] = "Comment successfully added"
        redirect_to post_path(@post)
      else
        render :new
      end
  end

  private

    def comment_params
      params.require(:comment).permit(:name, :content)
    end
end
