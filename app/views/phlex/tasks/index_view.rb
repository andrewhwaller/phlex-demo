# frozen_string_literal: true

class Phlex::Tasks::IndexView < ApplicationView
  def initialize(tasks:, notice: nil)
    @tasks = tasks
    @notice = notice
  end

  def template
    div(class: "w-full") do
      if @notice
        p(class: "py-2 px-3 bg-green-50 mb-50 text-green-500 font-medium rounded-lg inline-block", id: "notice") do
          plain @notice
        end
      end
      div(class: "flex justify-between items-center") do
        h1(class: "font-bold text-4xl") { "Tasks" }
        render LinkButtonComponent.new(text: "New task", path: new_phlex_task_path)
      end
      div(class: "min-w-full mt-5", id: "posts") do
        render ListComponent.new(empty_message: "No tasks yet!", item_name: "task", frame_title: "tasks") do |list|
          @tasks.each do |task|
            list.item do
              render Tasks::ListItemComponent.new(task: task)
            end
          end
        end
      end
    end
  end
end
