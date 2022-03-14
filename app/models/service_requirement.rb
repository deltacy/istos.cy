class ServiceRequirement < ApplicationRecord
  belongs_to :service
  belongs_to :requirement, class_name: 'Service'
end
