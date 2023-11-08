class Phlex::PostsController < ApplicationController
  def index
    @posts = Post.all
    render Phlex::Posts::IndexView.new(posts: @posts)
  end
end
