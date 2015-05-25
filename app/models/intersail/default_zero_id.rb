module Intersail

  # return zero instead of nil for the given ids
  # include this after Infoable mixin in order to make it work
  module DefaultZeroId
    extend ActiveSupport::Concern

    included do
      def before_initialize
        #@jtodoIMP test this like zero_default_id
        super() if respond_to? :super
        define_zero_attributes
      end

      def define_zero_attributes
        zero_attributes.each do |attr|
          instance_eval("def #{attr}() return 0 unless super(); super(); end")
          instance_eval("def #{attr}=(value) @#{attr}=value; end")
        end
      end
    end

    # Default zero_attributes implementation
    def zero_attributes
      []
    end
  end
end
