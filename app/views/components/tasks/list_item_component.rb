# frozen_string_literal: true

class Tasks::ListItemComponent < ApplicationComponent
  def template
    h1 { "Tasks::ListItem" }
    p { "Find me in app/views/components/tasks/list_item_component.rb" }
  end
end
