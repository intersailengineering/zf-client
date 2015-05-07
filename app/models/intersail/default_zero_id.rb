module Intersail
  module DefaultZeroId
    def id
      return 0 unless @id
      @id
    end

    def id=(value)
      @id = value
    end
  end
end
