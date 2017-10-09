require "../core"
require "./book"

module Books::Core

  abstract class Repository
    abstract def search(query) : Array(Book)
  end

end
