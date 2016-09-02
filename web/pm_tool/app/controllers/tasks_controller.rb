class TasksController < ApplicationController
  before_action :find_project
  before_action :find_task, only: [:show, :destroy, :update, :done]

  def new
    @task = Task.new
  end

  def show
    @discussions = @task.discussions
    @discussion = Discussion.new
  end

  def destroy
  end

  def update
    # @task.update
  end

  def done
    if !@task.done
      @task.update done: true
    else
      @task.update done: false
    end
    redirect_to project_path(@project)
  end

  def create
    @task = Task.new task_params
    @task.project = @project

    if @task.save
      redirect_to project_task_path(@project, @task), notice: "task created successfully"
    else
      flash[:alert] = "Error creating task"
      render :new
    end
  end


  private

  def find_task
    @task = Task.find params[:id]
  end

  def find_project
    @project = Project.find params[:project_id]
  end

  def task_params
    params.require(:task).permit(:title, :project_id, :done)
  end

  # def find_discussions
  #   @discussions = @task.discussions
  # end
end
