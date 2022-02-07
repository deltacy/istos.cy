class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :description
      t.string :website, null: false
      t.string :locale, null: false

      t.timestamps
    end
  end
end
