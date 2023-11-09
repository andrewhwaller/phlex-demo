class Phlex::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render Phlex::Tasks::IndexView.new(tasks: @tasks)
  end
end
