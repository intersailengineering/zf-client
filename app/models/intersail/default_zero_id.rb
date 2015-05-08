module Intersail
  module DefaultZeroId
    def zero_attributes(attributes)
      attributes.each do |attr|
        class_eval("def #{attr}() return 0 unless @#{attr}; @#{attr}; end")
        class_eval("def #{attr}=(value) @#{attr}=value; end")
      end
    end
  end
end
