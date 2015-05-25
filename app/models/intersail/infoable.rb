module Intersail

  # provides +is_info?+ and +data_attributes+ methods to handle info objects
  # with the same class
  # also creates an attributes_id accessor that you can use
  # to fetches the id of the attribute either if it's present in the attribute.id or
  # in the attribute_id field.
  module Infoable
    extend ActiveSupport::Concern

    included do
      send("include", ActiveModel::Model)

      def initialize(params={})
        before_initialize
        super
      end
    end

    def before_initialize
      super() if defined?(super)
      create_infoable_attributes_setter
      create_infoable_attributes_getter
    end

    # Obtain if this object is an info attribute or a resource attribute
    def is_info?(attr_name = nil)
      return instance_eval("#{attr_name}.nil?") if attr_name
      infoable_attributes.select { |attr| instance_eval("#{attr}.nil?") }.any?
    end

    # Return the list of all the associated attributes or attributes_id depending
    # on +is_info?+ or not
    def data_attributes
      my_attributes = {}
      # if is_info?
      #   infoable_attributes.each do |attr|
      #     my_attributes["#{attr}_id".to_sym] = instance_eval("#{attr}_id")
      #   end
      # else
      #   infoable_attributes.each do |attr|
      #     my_attributes[attr] = instance_eval(attr.to_s)
      #   end
      # end
      infoable_attributes.each do |attr|
        if is_info?(attr)
          my_attributes["#{attr}_id".to_sym] = instance_eval("#{attr}_id")
        else
          my_attributes[attr] = instance_eval(attr.to_s)
        end
      end
      my_attributes
    end

    # Default infoable implementation
    def infoable_attributes
      []
    end

    private
    def create_infoable_attributes_getter
      infoable_attributes.each do |attr|
        instance_eval("def #{attr}_id() (@#{attr} && @#{attr}.id) || super(); end")
      end
    end

    def create_infoable_attributes_setter
      infoable_attributes.each do |name|
        self.class.class_eval("attr_accessor :#{name}_id")
      end
    end
  end
end
