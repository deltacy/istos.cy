class PortalController < ApplicationController
  def index
    @popular_services = [Struct.new(:name).new('Popular service 1'),
                         Struct.new(:name).new('Popular service 2'),
                         Struct.new(:name).new('Popular service 3'),
                         Struct.new(:name).new('Popular service 4'),
                         Struct.new(:name).new('Popular service 5')]

    @services = [Struct.new(:name, :description).new('Department of lands and surverys', 'The home of HM Land Registry. Go here to register the ownership of land and property in Cyprus.'),
                 Struct.new(:name, :description).new('Coronavirus', 'Coronavirus advice website.'),
    ]

  end
end
