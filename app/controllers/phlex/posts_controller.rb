class Phlex::PostsController < ApplicationController
  def index
    @posts_pagy, @posts = pagy(Post.all, items: 5, link_extra: "data-turbo-frame='posts'")
    render Phlex::Posts::IndexView.new(posts: @posts, pagy: @posts_pagy)
  end

  def new
    @post = Post.new
    render Phlex::Posts::NewView.new(post: @post)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to phlex_posts_path, notice: "Post created!"
    else
      render Phlex::Posts::NewView.new(post: @post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to phlex_posts_path, notice: "Post deleted!"
  end

  def edit
    @post = Post.find(params[:id])
    render Phlex::Posts::EditView.new(post: @post)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to phlex_posts_path, notice: "Post updated!"
    else
      render Phlex::Posts::EditView.new(post: @post)
    end
  end

  def show
    @post = Post.find(params[:id])
    render Phlex::Posts::ShowView.new(post: @post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
