require "http"

class HttpClient
  def get(url : String)
    response = HTTP::Client.get(url)
    response.body
  end
end
