class AddAvailabilityToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :availability, :integer
  end
end
