require 'rails_helper'

describe "can retrive movie info from guidebox api" do 
  it 'has proper attributes' do 
    service    = GuideBoxService.new 
    response   = service.get_movie("Stranger Than Fiction")

    expect(response).to eq ""
  end

  it "can get streaming data from id" do 
    service  = GuideBoxService.new
    movies = service.parse_search_response(service.get_movie("Stranger Than Fiction"))
    streaming_data = service.get_streaming_data(movies.first)
    
    expect(streaming_data).to eq ""
  end  
end 
