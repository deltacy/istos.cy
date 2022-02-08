class AddSlugToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :slug, :string

    add_index :services, %i[slug locale], unique: true
  end
end
