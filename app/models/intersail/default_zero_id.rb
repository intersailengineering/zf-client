module Intersail

  # return zero instead of nil for the given ids
  # Important: include this mixin only after the Intersail::Infoable mixin in order to make this work correctly
  module DefaultZeroId
    extend ActiveSupport::Concern

    included do
      send("include", ActiveModel::Model)

      def initialize(params={})
        before_initialize
        super
      end
    end

    def define_zero_attributes
      zero_attributes.each do |attr|
        # To handle interaction with infoable
        class_eval("alias_method :orig_#{attr.to_s}, :#{attr}")
        instance_eval("def #{attr}() return 0 unless orig_#{attr}(); orig_#{attr}(); end")
      end
    end

    def before_initialize
      super() if defined?(super)
      define_zero_attributes
    end

    # Default zero_attributes implementation
    def zero_attributes
      []
    end
  end
end
