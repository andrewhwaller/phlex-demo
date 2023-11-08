# frozen_string_literal: true

class Phlex::Tasks::NewView < ApplicationView
  def template
    h1 { "Phlex::Tasks::New" }
    p { "Find me in app/views/phlex/tasks/new_view.rb" }
  end
end
