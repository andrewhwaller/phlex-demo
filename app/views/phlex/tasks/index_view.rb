# frozen_string_literal: true

class Phlex::Tasks::IndexView < ApplicationView
  def template
    h1 { "Phlex::Tasks::Index" }
    p { "Find me in app/views/phlex/tasks/index_view.rb" }
  end
end
