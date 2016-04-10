class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
  def index
    @comments = Comment.all
  end
 
  def show
  end
  
  def new
    @comment = Comment.new
  end
 
  def edit
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private

    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to root_path 
      end
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
 
    def comment_params
      params.require(:comment).permit(:name, :email, :website, :thoughts)
    end
end
