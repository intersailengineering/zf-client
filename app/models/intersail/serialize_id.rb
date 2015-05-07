module Intersail
  module SerializeId
    def id
      return 0 unless @id
      @id
    end

    def id=(value)
      @id = value
    end
  end
end
