class GuideBoxService

  def initialize
    @connection = Faraday.new(url: "http://api-public.guidebox.com") 
  end  

  def get_movie(name, search_type="exact")
    response = @connection.get do |req|
      encoded_name = triple_encode(name)
      req.url "/v1.43/US/#{ENV['guide_box_key']}/search/movie/title/#{encoded_name}/#{search_type}"
    end 
  end

  def get_full_movie_data(movie)
    response = @connection.get do |req|
      req.url "/v1.43/US/#{ENV['guide_box_key']}/movie/#{movie[:id]}"
    end
  end

  def get_streaming_data(movie)
    movie = parse_response(get_full_movie_data(movie))
    construct_sources(movie)  
  end 

  def parse_search_response(response)
    parse_response(response)[:results]
  end 

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private 
  
    def triple_encode(name)
      3.times do 
        CGI.escape(name)
      end 
    end

    def construct_sources(movie_data)
      {
        free_sources: movie_data[:free_web_sources], 
        paid_sources: movie_data[:purchase_web_sources]
      }
    end  
end 