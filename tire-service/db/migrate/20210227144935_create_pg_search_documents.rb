class CreatePgSearchDocuments < ActiveRecord::Migration[5.2]
  def up
    safety_assured do
      say_with_time("Creating table for pg_search multisearch") do
        create_table :pg_search_documents do |t|
          t.text :content
          t.belongs_to :searchable, :polymorphic => true, :index => true
          t.timestamps null: false
        end
      end
    end
  end

  def down
    safety_assured do
      say_with_time("Dropping table for pg_search multisearch") do
        drop_table :pg_search_documents
      end
    end
  end
end
