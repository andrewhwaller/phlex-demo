require "phlex/testing/rails/view_helper"

class LinkButtonComponentTest < ActiveSupport::TestCase
  include Phlex::Testing::Rails::ViewHelper
  include Phlex::Testing::Nokogiri::FragmentHelper

  test "should render the appropriate text" do
    component = LinkButtonComponent.new(text: "Click me", path: "/")
    output = render component
    parsed_output = Nokogiri::HTML.fragment(output)
    assert_includes parsed_output.text, "Click me"
  end
end
