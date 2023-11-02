require "phlex/testing/rails/view_helper"

class LinkButtonComponentTest < ActiveSupport::TestCase
  include Phlex::Testing::Rails::ViewHelper
  include Phlex::Testing::Nokogiri::FragmentHelper

  test "should render the appropriate text" do
    component = LinkButtonComponent.new(text: "Click me", path: "/")
    output = render component

    assert_includes output.text, "Click me"
  end

  class ColorsTest < ActiveSupport::TestCase
    include Phlex::Testing::Rails::ViewHelper
    include Phlex::Testing::Nokogiri::FragmentHelper

    test "appropriately displays success button" do
      green_component = LinkButtonComponent.new(text: "Click me", path: "/", type: Colors::SUCCESS)
      green_output = render green_component

      assert_includes green_output.css("a").first["class"], "bg-green-500"
    end

    test "appropriately displays danger button" do
      red_component = LinkButtonComponent.new(text: "Click me", path: "/", type: Colors::DANGER)
      red_output = render red_component

      assert_includes red_output.css("a").first["class"], "bg-red-500"
    end

    test "appropriately displays default button" do
      default_component = LinkButtonComponent.new(text: "Click me", path: "/")
      default_output = render default_component

      assert_includes default_output.css("a").first["class"], "bg-gray-100"
    end
  end
end
