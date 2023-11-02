# frozen_string_literal: true

class PagyCustomComponent < ApplicationComponent
  def initialize(pagy:, item_name:)
    @pagy = pagy
    @item_name = item_name
  end

  def template
    link = helpers.pagy_link_proc(@pagy)
    nav(
      aria_label: "pager",
      class:
        "bg-white px-4 py-4 flex items-center justify-between sm:px-5",
      role: "navigation"
    ) do
      span(class: "text-sm text-gray-700 my-auto hidden sm:block flex-wrap mr-3") do
        unsafe_raw helpers.pagy_info(@pagy, item_name: @item_name.pluralize(@pagy.count))
      end
      div(class: "flex-1 flex justify-between sm:justify-end gap-3") do
        if @pagy.prev
          unsafe_raw link.call(@pagy.prev, "Previous", 'aria-label="previous" class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50"')
        else
          button(class: "relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-gray-100 cursor-not-allowed") { "Previous" }
        end
        if @pagy.next
          unsafe_raw link.call(@pagy.next, "Next", 'aria-label="next" class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50"')
        else
          button(class: "relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-gray-100 cursor-not-allowed") { "Next" }
        end
      end
    end
  end
end
