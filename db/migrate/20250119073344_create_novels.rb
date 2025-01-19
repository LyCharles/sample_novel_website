class CreateNovels < ActiveRecord::Migration[7.1]
  def change
    create_table :novels do |t|
      t.string :title
      t.string :author
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
