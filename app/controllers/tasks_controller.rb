class TasksController < ApplicationController
 before_action :find_task , only: [:show, :edit, :update, :destroy]
 # you add the before_action when you want to acces the method that you
 # created since its been repeated in the controller inside the other methods.
 def index
    # GET /tasks
    @tasks = Task.all
 end

 def show
    #@task = Task.find(params[:id])
    # GET /tasks/:id
 end

  def new
    @task = Task.new
    # GET /tasks/new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
    # POST /tasks
  end

  def edit
    #@task = Task.find(params[:id])
    # GET /tasks/:id/edit
  end

  def update
    # @task = Task.find(params[:id]) u dont need to use it
    # anymore since you are stating it in the before_action
    @task.update(task_params)
    redirect_to task_path(@task)
    # PATCH /tasks/:id
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
    # DELETE /tasks/:id
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
  def find_task
    @task = Task.find(params[:id])
  end
end
