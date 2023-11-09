# frozen_string_literal: true

class Tasks::ListItemComponent < ApplicationComponent
  def initialize(task:)
    @task = task
  end

  def template
    div(class: "flex") do
      div(class: "flex-1") do
        h3(class: "text-lg leading-6 font-medium text-gray-900") do
          plain @task.name
        end
        p(class: "mt-1 max-w-2xl text-sm text-gray-500") do
          plain @task.due_date.strftime("%B %d, %Y")
        end
        p(class: "mt-1 max-w-2xl text-sm text-gray-500") do
          plain @task.complete.to_s
        end
      end
      div do
        div(class: "flex gap-3 ml-5 flex-shrink-0") do
          render LinkButtonComponent.new(text: "Edit this task", path: edit_phlex_task_path(@task))
          render LinkButtonComponent.new(text: "Show this task", path: phlex_task_path(@task))
        end
      end
    end
  end
end
