# frozen_string_literal: true

class ListItemComponent < ApplicationComponent
  def template(&block)
    li(class: "px-4 py-4 sm:px-6") do
      render block
    end
  end
end
