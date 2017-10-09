require "../cli"
require "./book_decorator"
require "../../core/service"

module Books::Adapters::CLI

  class Controller
    def initialize(@service : Core::Service)
    end

    def find_books(term : String)
      books = BookDecorator.wrap(@service.find_books(term))

      books.each do |book|
        puts "-------------------------------------------------------------"
        puts " Title:     #{book.title}"
        puts " Authors:   #{book.authors}"
        puts " Publisher: #{book.publisher}"
        puts " ISBN:      #{book.isbn}"
      end
    end
  end

end
