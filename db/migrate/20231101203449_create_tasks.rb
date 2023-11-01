class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.timestamp :due_date
      t.boolean :complete

      t.timestamps
    end
  end
end
