class GuideBoxService

  def initialize
    @connection = Faraday.new(url: "http://api-public.guidebox.com") 
  end  

  def get_movie
    encoded_name = triple_encode("Stranger Than Fiction")
    response = @connection.get do |req|
      req.url "/v1.43/US/#{ENV['guide_box_key']}/search/movie/title/#{encoded_name}/fuzzy"
    end 
    binding.pry
  end 


  private 
    def triple_encode(name)
      3.times do 
        CGI.escape(name)
      end 
    end 

end 