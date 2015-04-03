class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    @comment.post_id = params[:post_id]
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Comment successfully added"
          redirect_to post_path(@post)
        end
        format.js { flash.now[:notice] = "Your comment was added." }
      end
    else
      respond_to do |format|
        format.html do
          flash[:alert] = "There were some errors..."
          render :new
        end
        format.js { flash.now[:alert] = "Comments can't be blank." }
      end
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      respond_to do |format|
        format.html do
          flash[:notice] = "Comment successfully updated"
          redirect_to post_path(@post)
        end
        format.js { flash.now[:notice] = "Comment updated." }
      end
    else
      respond_to do |format|
        format.html do
          flash[:alert] = "There were some errors..."
          render :edit
        end
        format.js { flash.now[:alert] = "An error occured. Please try again." }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.destroy(params[:id])
    respond_to do |format|
      format.html do
        flash[:alert] = "Comment permanently deleted"
        redirect_to post_path(@post)
      end
      format.js { flash.now[:alert] = "Comment permanently deleted" }
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
