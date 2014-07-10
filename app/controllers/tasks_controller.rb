class TasksController < ApplicationController

  def create
    @task = Project.find(params[:project_id]).tasks.create(name: params[:name])
  end

  def destroy
    @task = task
    @task.destroy
  end

  def finish
    @task = task
    @task.update(done: true)
    render :refresh
  end

  def start
    @task = task
    @log = Log.create(task: @task, start: Time.now)
    render :refresh
  end

  def stop
    @task = task
    @log = @task.logs.first.update(stop: Time.now)
    render :refresh
  end

  private

  def task
    Task.find(params[:id])
  end

end
