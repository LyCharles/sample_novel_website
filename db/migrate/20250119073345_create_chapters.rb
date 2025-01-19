class CreateChapters < ActiveRecord::Migration[7.1]
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :content
      t.integer :chapter_number
      t.references :novel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
