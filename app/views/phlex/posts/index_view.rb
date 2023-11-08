# frozen_string_literal: true

class Phlex::Posts::IndexView < ApplicationView
  def template
    h1 { "Phlex::Posts::Index" }
    p { "Find me in app/views/phlex/posts/index_view.rb" }
  end
end
