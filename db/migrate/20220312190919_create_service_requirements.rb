class CreateServiceRequirements < ActiveRecord::Migration[7.0]
  def change
    create_table :service_requirements do |t|
      t.references :service, null: false, foreign_key: true
      t.integer :requirement_id, null: false, foreign_key: true
      t.string :title, collation: 'latinlast'

      t.timestamps
    end

    add_index :service_requirements, %i[service_id requirement_id], unique: true
  end
end
