class GuideBoxService

  def initialize
    @connection = Faraday.new(url: "http://api-public.guidebox.com") 
  end  

  def get_movie
    response = @connection.get do |req|
      req.url "/v1.43/US/#{ENV['guide_box_key']}/movies/all/50/10"
    end 
  end 
end 