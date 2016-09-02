class DiscussionsController < ApplicationController
  before_action :find_task
  before_action :find_project
  before_action :find_discussion, only: [:show]

  def create
    @discussion = Discussion.new discussion_params
    @discussion.task = @task
    if @discussion.save
      redirect_to project_task_path(@task.project, @task), notice: "discussion created successfully"
    else
      redirect_to project_task_path(@task.project, @task), alert: "error creating discussion"
    end
  end

  def show
    @comments = @discussion.comments
  end

  def new
    @discussion = Discussion.new
  end

  private

  def discussion_params
    params.require(:discussion).permit(:title, :description)
  end

  def find_project
    @project = @task.project
  end

  def find_task
    @task = Task.find params[:task_id]
  end

  def find_discussion
    @discussion = Discussion.find params[:id]
  end
end
