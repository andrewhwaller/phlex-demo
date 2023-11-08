# frozen_string_literal: true

class Phlex::Tasks::ShowView < ApplicationView
  def template
    h1 { "Phlex::Tasks::Show" }
    p { "Find me in app/views/phlex/tasks/show_view.rb" }
  end
end
