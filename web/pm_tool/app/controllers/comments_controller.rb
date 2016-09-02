class CommentsController < ApplicationController
  before_action :find_discussion
  before_action :find_comment, only[:destroy]

  def create
    @comment = Comment.new comment_params
    @comment.discussion = @discussion
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment saved successfully"
    else
      flash[:alert]="Error creating comment."
    end
    redirect_to discussion_path(@comment)
  end

  def destroy
    @discussion.destroy
    redirect_to task_discussion_path(@task, @discussion)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :discussion_id)
  end

  def find_discussion
    @discussion = Discussion.find params[:id]
  end

  def find_comment
    @comment = Comment.find params[:id]
  end

end
