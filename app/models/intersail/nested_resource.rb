module Intersail
  module NestedResource
    def from_hash(hash)
      current_unit = unit = send("new", hash)
      # Loop through all parents
      while current_unit.parent && current_unit.parent.is_a?(Hash)
        current_unit = current_unit.parent = send("new", current_unit.parent)
      end
      unit
    end
  end
end
