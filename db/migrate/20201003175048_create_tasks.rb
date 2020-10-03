class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :benchmark
      t.belongs_to :project, null: false, foreign_key: true
      t.integer :total
      t.integer :last_session

      t.timestamps
    end
  end
end
