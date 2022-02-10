class AddInformationToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :information, :text
  end
end
