class AddTranslationsToNovels < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        Novel.create_translation_table!({
          title: :string,
          description: :text,
          author: :string
        }, {
          migrate_data: true,
          remove_source_columns: true
        })
      end

      dir.down do
        Novel.drop_translation_table! migrate_data: true
      end
    end
  end
end 