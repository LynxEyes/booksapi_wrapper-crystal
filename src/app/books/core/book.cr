require "../core"
require "./book_identifier"

module Books::Core

  class Book

    def initialize(
      @title : String,
      @authors : Array(String),
      @publisher : String,
      @industry_identifiers : Array(BookIdentifier)
    )
    end

    getter title, authors, publisher, industry_identifiers

  end

end
