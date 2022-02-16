class ServiceTopic < ApplicationRecord
  belongs_to :service
  belongs_to :topic
end
