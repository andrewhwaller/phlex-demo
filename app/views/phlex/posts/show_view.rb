# frozen_string_literal: true

class Phlex::Posts::ShowView < ApplicationView
  def template
    h1 { "Phlex::Posts::Show" }
    p { "Find me in app/views/phlex/posts/show_view.rb" }
  end
end
