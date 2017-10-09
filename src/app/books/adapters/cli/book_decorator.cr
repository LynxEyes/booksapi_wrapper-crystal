require "../cli"
require "../../core/book"

module Books::Adapters::CLI

  class BookDecorator
    def self.wrap(collection : Array(Core::Book))
      collection.map { |b| new(b) }
    end

    def self.wrap(book : Core::Book)
      new(book)
    end

    EMPTY_RESPONSE = "N/A"

    def initialize(@book : Core::Book)
    end

    def title
      @book.title || EMPTY_RESPONSE
    end

    def authors
      if @book.authors
        @book.authors.join(", ")
      else
        EMPTY_RESPONSE
      end
    end

    def publisher
      @book.publisher || EMPTY_RESPONSE
    end

    def isbn
      found = @book.industry_identifiers.find { |ident|
        ident.isbn_type == "ISBN_13"
      }

      return found.identifier if found
      EMPTY_RESPONSE
    end
  end

end
