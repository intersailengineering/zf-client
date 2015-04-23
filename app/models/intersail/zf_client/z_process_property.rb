module Intersail
  module ZfClient
    class ZProcessProperty
      include ActiveModel::Model

      attr_accessor :name
      attr_accessor :value

      validates_presence_of :name
      validates_presence_of :value

    end
  end
end