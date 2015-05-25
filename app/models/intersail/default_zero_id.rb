module Intersail

  # return zero instead of nil for the given ids
  # include this after Infoable mixin in order to make it work
  module DefaultZeroId

    def initialize(params={})
      before_initialize
      #@jtodoIMP test this
      super(params) if respond_to?(:super)
    end

    def define_zero_attributes
      zero_attributes.each do |attr|
        instance_eval("def #{attr}() return 0 unless super(); super(); end")
        instance_eval("def #{attr}=(value) @#{attr}=value; end")
      end
    end

    def before_initialize
      #@jtodoIMP test this like zero_default_id
      super() if respond_to?(:super)
      create_infoable_attributes_setter
      define_zero_attributes
    end

    # Default zero_attributes implementation
    def zero_attributes
      []
    end
  end
end
