require "./app/books/core/service"
require "./app/books/adapters/data/repository"
require "./app/books/adapters/cli/controller"
require "./app/util/http_client"

API_URL = "https://www.googleapis.com/books/v1/volumes?q="

http_client = HttpClient.new
repository  = Books::Adapters::Data::Repository.new(API_URL, http_client)
service     = Books::Core::Service.new(repository)
controller  = Books::Adapters::CLI::Controller.new(service)

controller.find_books("tolkien")
