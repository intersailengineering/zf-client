module Intersail
  module Infoable
    extend ActiveSupport::Concern

    included do
      send("include", ActiveModel::Model)

      def initialize(params={})
        super
        create_infoable_attributes
      end

      # Obtain if this object is an info attribute or a resource attribute
      def is_info?
        has_resources = infoable_attributes.select {|attr| instance_eval("#{attr}.nil?") }.count > 0
        has_infoable = infoable_attributes.select {|attr| instance_eval("#{attr}_id.nil?") }.count > 0
        !has_infoable && has_resources
      end

      # Return the list of all his associated attributes or attributes_id depending
      # if is an info object or not
      def data_attributes
        my_attributes = {}
        infoable_attributes.each do |attr|
           my_attributes["#{attr}_id".to_sym] = instance_eval(attr.to_s)
        end
        my_attributes
      end

      private

      def create_infoable_attributes
        infoable_attributes.each do |name|
          self.class.class_eval("attr_accessor :#{name}_id")
        end
      end
    end
  end
end
