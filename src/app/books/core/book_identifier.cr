require "../core"

module Books::Core

  class BookIdentifier
    def initialize(
      @isbn_type : String,
      @identifier : String
    )
    end

    getter isbn_type, identifier
  end

end
