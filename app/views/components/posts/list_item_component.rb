# frozen_string_literal: true

class Posts::ListItemComponent < ApplicationComponent
  def initialize(post:)
    @post = post
  end

  def template
    div(class: "flex px-4 py-4 sm:px-6") do
      div(class: "flex-1") do
        h3(class: "text-lg leading-6 font-medium text-gray-900") do
          plain @post.title
        end
        p(class: "mt-1 max-w-2xl text-sm text-gray-500") do
          plain @post.content
        end
      end
      div(class: "ml-5 flex-shrink-0") do
        render LinkButtonComponent.new(text: "Edit", path: edit_post_path(@post))
      end
    end
  end
end
