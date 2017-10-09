require "./api_response"
require "../data"
require "../../core/book"
require "../../core/repository"
require "../../../util/http_client"

module Books::Adapters::Data

  class Repository < Books::Core::Repository
    def initialize(@api_url : String, @client : HttpClient)
    end

    def search(query) : Array(Core::Book)
      raw = @client.get(build_url(query))
      ApiResponse.from_json(raw).to_books
    end

    private def build_url(query)
      "#{@api_url}#{query}"
    end
  end

end
