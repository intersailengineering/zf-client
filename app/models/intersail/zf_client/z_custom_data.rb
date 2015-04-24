module Intersail
  module ZfClient
    class ZCustomData

      include ActiveModel::Model

      # Attributes
      attr_accessor :name
      attr_accessor :value

      # Validation
      validates_presence_of :name
      validates_presence_of :value
      
    end
  end
end