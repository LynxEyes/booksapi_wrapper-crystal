require "json"
require "../data"
require "../../core/book"
require "../../core/book_identifier"

module Books::Adapters::Data

  class ApiResponse
    Book = Core::Book

    JSON.mapping(items: Array(Item))

    def initialize
      @items = [] of Item
    end

    def to_books
      @items.map { |i| i.to_book }
    end

    # Inner JSON mapping class
    class Item
      JSON.mapping(volumeInfo: VolumeInfo)

      def to_book
        Book.new(
          @volumeInfo.title,
          @volumeInfo.authors,
          @volumeInfo.publisher,
          @volumeInfo.industryIdentifiers.map { |id|
            Core::BookIdentifier.new(id.isbn_type, id.identifier)
          }
        )
      end
    end

    # Inner JSON mapping class
    class VolumeInfo
      JSON.mapping(
        title: String,
        authors: Array(String),
        publisher: String,
        industryIdentifiers: Array(IndustryIdentifier)
      )
    end

    # Inner JSON mapping class
    class IndustryIdentifier
      JSON.mapping(
        isbn_type: {type: String, key: "type"},
        identifier: String
      )
    end
  end

end
