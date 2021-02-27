class CreateFrontArticles < ActiveRecord::Migration[5.2]
  def up
    safety_assured do
      create_table :front_articles do |t|
        t.string :title
        t.text :text
  
        t.timestamps
      end
    end
  end

  def down
    safety_assured do
      drop_table :front_articles
    end
  end
end
