# frozen_string_literal: true

class LinkButtonComponent < ApplicationComponent
  include Phlex::Rails::Helpers::LinkTo

  def initialize(text:, path:, type: nil)
    @text = text
    @class = "ml-2 rounded-lg py-3 px-5 inline-block font-medium #{color_classes(type)}"
    @path = path
  end

  def template
    link_to(@text, @path, class: @class)
  end

  def color_classes(type)
    case type
    when Colors::SUCCESS
      "bg-green-500 hover:bg-green-700 text-white"
    when Colors::DANGER
      "bg-red-500 hover:bg-red-700 text-white"
    when Colors::WARNING
      "bg-yellow-500 hover:bg-yellow-700 text-white"
    when Colors::INFO
      "bg-blue-500 hover:bg-blue-700 text-white"
    else
      "bg-gray-100 hover:bg-gray-300"
    end
  end
end
