# frozen_string_literal: true

class Phlex::Posts::NewView < ApplicationView
  def template
    h1 { "Phlex::Posts::New" }
    p { "Find me in app/views/phlex/posts/new_view.rb" }
  end
end
