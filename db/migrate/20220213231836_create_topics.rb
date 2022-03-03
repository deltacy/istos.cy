class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.string :slug
      t.string :name, null: false, collation: 'latinlast'
      t.text :description, collation: 'latinlast'
      t.references :topic, foreign_key: true
      t.string :locale, null: false

      t.timestamps
    end

    add_index :topics, %i[slug locale], unique: true
  end
end
