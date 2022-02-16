class CreateServiceTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :service_topics do |t|
      t.references :service, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end

    add_index :service_topics, %i[service_id topic_id], unique: true
  end
end
