class ProjectsController < ApplicationController
  before_action :find_project, only:[:show, :edit, :update, :destroy]

  def show
    @tasks = @project.tasks.order("done ASC")
    @task = @project.tasks.new
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new project_params

    if@project.save
      redirect_to project_path(@project), notice: "Project created"
    else
      flash[:alert] = "Error creating project"
      render :new
    end

  end

  def update
  end

  def destroy
  end

  def index
    @projects = Project.all.order("due_date")

  end

  private

  def find_project
    @project = Project.find params[:id]
  end

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end
end
