# frozen_string_literal: true

class Posts::FormComponent < ApplicationComponent
  include Phlex::Rails::Helpers::FormWith

  def initialize(post:, action:)
    @post = post
    @action = action
  end

  def template
    form_with model: @post, url: phlex_posts_path, method: :post, class: "w-full flex flex-col gap-3" do |form|
      if @post.errors.any?
        div(id: "error_explanation", class: "bg-red-50 text-red-500 px-3 py-2 font-medium rounded-lg mt-3") do
          h2 do
            plain "There are #{pluralize(@post_error_count, "error")}:"
          end
          ul do
            @post.errors.each do |error|
              li do
                plain error.full_message
              end
            end
          end
        end
      end
      div do
        form.label :title
        form.text_field :title, class: "block shadow rounded-md border border=gray-200 outline-none px-3 py-2 mt-2 w-full"
      end
      div do
        form.label :content
        form.text_field :content, class: "block shadow rounded-md border border=gray-200 outline-none px-3 py-2 mt-2 w-full"
      end
      div(class: "inline") do
        form.submit action_label(@action), class: "rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer"
      end
    end
  end

  def action_label(action)
    case action
    when :new
      "Create post"
    when :edit
      "Update post"
    end
  end
end
