class DefaultServicesAvailabilityValue < ActiveRecord::Migration[7.0]
  def change
    change_column :services, :availability, :integer, default: 2
  end
end
