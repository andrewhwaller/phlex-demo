# frozen_string_literal: true

class ListComponent < ApplicationComponent
  include Phlex::DeferredRender
  include Phlex::Rails::Helpers::TurboFrameTag

  def initialize(title: nil, empty_message:, frame_title:, item_name:, pagy: nil)
    @title = title
    @empty_message = empty_message
    @frame_title = frame_title
    @list_items = []
    @pagy = pagy
    @item_name = item_name
  end

  def template
    div(class: "flex flex-col gap-5") do
      if @title
        h1(class: "font-bold text-4xl") { @title }
      end
      turbo_frame_tag @frame_title, target: "_top" do
        div(class: "bg-white shadow overflow-hidden rounded-md") do
          if @list_items.any?
            if @pagy
              render PagyCustomComponent.new(
                pagy: @pagy,
                item_name: @item_name
              )
            end
            ul(class: "divide-y divide-gray-200 list-none", role: "list") do
              @list_items.each do |list_item|
                render list_item
              end
            end
          else
            div(class: "px-4 py-5 sm:p-6") do
              span(class: "text-base text-gray-500") { @empty_message }
            end
          end
        end
      end
    end
  end

  def item(...)
    @list_items << ListItemComponent.new(...)
  end
end
