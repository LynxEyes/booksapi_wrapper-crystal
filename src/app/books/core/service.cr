require "../core"
require "./repository"

module Books::Core

  class Service
    def initialize(@repository : Repository)
    end

    def find_books(query)
      @repository.search(query)
    end
  end

end
