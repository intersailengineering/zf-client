# This validator validates all elements in the attribute array and run valid? on them
# if it's not an array run valid? on the element and then sett errors
module Intersail
  module Validators
    class SubAttributeValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return unless value
        # loop if enumerable
        if value.is_a? Enumerable
          value.map do |val|
            record.errors[attribute] << val.errors.full_message unless val.valid?
          end
        else
          record.errors[attribute] << value.errors.full_message unless value.valid?
        end
      end
    end
  end
end