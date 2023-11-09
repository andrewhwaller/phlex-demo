# frozen_string_literal: true

class Phlex::Posts::IndexView < ApplicationView
  def initialize(posts:, pagy:, notice: nil)
    @posts = posts
    @pagy = pagy
    @notice = notice
  end

  def template
    div(class: "w-full") do
      if @notice
        p(class: "py-2 px-3 bg-green-50 mb-50 text-green-500 font-medium rounded-lg inline-block", id: "notice") do
          plain @notice
        end
      end
      div(class: "flex justify-between items-center") do
        h1(class: "font-bold text-4xl") { "Posts" }
        render LinkButtonComponent.new(text: "New post", path: new_phlex_post_path)
      end
      div(class: "min-w-full mt-5", id: "posts") do
        render ListComponent.new(empty_message: "No posts yet!", item_name: "post", frame_title: "posts", pagy: @pagy) do |list|
          @posts.each do |post|
            list.item do
              render Posts::ListItemComponent.new(post: post)
            end
          end
        end
      end
    end
  end
end
