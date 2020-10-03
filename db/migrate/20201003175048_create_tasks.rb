class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :benchmark
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
