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
        super
        after_initialize
      end

      private

      def after_initialize
        create_infoable_attributes_setter
        create_infoable_attributes_getter

      end

      def create_infoable_attributes_getter
        infoable_attributes.each do |attr|
          self.class.class_eval("def #{attr}_id() @#{attr}_id || @#{attr} && @#{attr}.id end")
        end
      end

      def create_infoable_attributes_setter
        infoable_attributes.each do |name|
          self.class.class_eval("attr_accessor :#{name}_id")
        end
      end
    end

    # Obtain if this object is an info attribute or a resource attribute
    def is_info?
      has_resources = infoable_attributes.select { |attr| instance_eval("#{attr}.nil?") }.count > 0
      has_infoable = infoable_attributes.select { |attr| instance_eval("#{attr}_id.nil?") }.count > 0
      !has_infoable && has_resources
    end

    # Return the list of all the associated attributes or attributes_id depending
    # on +is_info?+ or not
    def data_attributes
      my_attributes = {}
      if is_info?
        infoable_attributes.each do |attr|
          my_attributes["#{attr}_id".to_sym] = instance_eval("#{attr}_id")
        end
      else
        infoable_attributes.each do |attr|
          my_attributes[attr] = instance_eval(attr.to_s)
        end
      end
      my_attributes
    end

    # Default infoable implementation
    def infoable_attributes
      []
    end

  end
end
