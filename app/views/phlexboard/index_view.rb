# frozen_string_literal: true

class Phlexboard::IndexView < ApplicationView
  def template
    h1 { "Phlexboard::Index" }
    p { "Find me in app/views/phlexboard/index_view.rb" }
  end
end
