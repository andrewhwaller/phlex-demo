# frozen_string_literal: true

class Phlex::Posts::EditView < ApplicationView
  def initialize(post:)
    @post = post
  end

  def template
    h1(class: "font-bold text-4xl mb-5") { "Edit post" }
    render Posts::FormComponent.new(post: @post, action: :edit)
  end
end
