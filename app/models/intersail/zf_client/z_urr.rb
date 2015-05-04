module Intersail
  module ZfClient
    class ZUrr

      # when i get get_urr i want to have the urr otherwise urr_info
      # with i do get_urr i have unit(name desc parent...) role(name desc parent...)
      # resource(data, urrs vuoto)

      # implement this methodology into a mixin,
      # first you have a method like this:
      # is_info? that return true if the resource field are not filled but atleast some of the id are
      # you have a method that allow you to obtain the desired attributes depending on his type
      # and all you have to do is to call this method.


      include ActiveModel::Model
      include Serializable

      # Attributes
      attr_accessor :id
      # class attributes
      attr_accessor :unit
      attr_accessor :role
      attr_accessor :resource
      # id attributes
      #@jtodoIMP put in the mixin
      attr_accessor :unit_id
      attr_accessor :role_id
      attr_accessor :resource_id

      # Validation
      # validates presence of either class param or class_id
      validates_presence_of :unit_id
      validates_presence_of :role_id
      validates_presence_of :resource_id

      #@jtodoIMP put in the mixin
      def unit_id
        @unit_id || self.unit && self.unit.id
      end

      def role_id
        @role_id || self.role && self.role.id
      end

      def resource_id
        @resource_id || self.resource && self.resource.id
      end

      # Serialization
      def attributes
        {
            "unit_id" => nil,
            "role_id" => nil,
            "resource_id" => nil
        }
      end

      def attributes_to_include
        []
      end
    end
  end
end