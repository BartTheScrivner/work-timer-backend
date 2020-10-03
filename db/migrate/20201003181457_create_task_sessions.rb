class CreateTaskSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :task_sessions do |t|
      t.belongs_to :task, null: false, foreign_key: true
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
