# frozen_string_literal: true

class Phlex::Posts::ShowView < ApplicationView
  include Phlex::Rails::Helpers::DOMID
  include Phlex::Rails::Helpers::ButtonTo

  def initialize(post:, notice: nil)
    @post = post
    @notice = notice
  end

  def template
    div(class: "mx-auto md:2-2/3 w-full flex") do
      div(class: "mx-auto") do
        if @notice
          p(class: "py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block", id: "notice") { plain @notice }
        end
        div(id: dom_id(@post)) do
          p(class: "my-5") do
            strong(class: "block font-medium mb-1") { "Title:" }
            plain @post.title
          end
          p(class: "my-5") do
            strong(class: "block font-medium mb-1") { "Content:" }
            plain @post.content
          end
          div(class: "flex gap-3 ml-5 flex-shrink-0") do
            render LinkButtonComponent.new(text: "Edit this post", path: edit_phlex_post_path(@post))
            div do
              button_to "Delete this post", phlex_post_path(@post), method: :delete, class: "bg-red-500 hover:bg-red-700 text-white ml-2 rounded-lg py-3 px-5 inline-block font-medium"
            end
            render LinkButtonComponent.new(text: "Back to posts", path: phlex_posts_path)
          end
        end
      end
    end
  end
end
