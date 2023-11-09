# frozen_string_literal: true

class Phlex::Posts::NewView < ApplicationView
  def initialize(post:)
    @post = post
  end

  def template
    h1(class: "font-bold text-4xl mb-5") { "New post" }
    render Posts::FormComponent.new(post: @post, action: :new)
  end
end
