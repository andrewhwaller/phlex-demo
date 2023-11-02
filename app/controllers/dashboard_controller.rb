class DashboardController < ApplicationController
  def index
    @posts = Post.all
    @tasks = Task.all
  end
end
