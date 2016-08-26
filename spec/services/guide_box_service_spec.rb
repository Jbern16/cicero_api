require 'rails_helper'

describe "can retrive movie info from guidebox api" do 
  it 'has proper attributes' do 
    service    = GuideBoxService.new 
    parsed_response   = service.parse_search_response(service.get_movie("Stranger Than Fiction"))

    expect(parsed_response.first[:title]).to eq "3"
  end

  it "can get streaming data from id" do 
    service  = GuideBoxService.new
    movies = service.parse_search_response(service.get_movie("Stranger Than Fiction"))
    streaming_data = service.get_streaming_data(movies.first)

    expect(streaming_data[:free_sources]).to eq []
    expect(streaming_data[:paid_sources]).to eq [{:source=>"itunes", :display_name=>"iTunes", :link=>"https://itunes.apple.com/us/movie//id494556756?uo=4&at=10laHb", :formats=>[{:price=>"9.99", :format=>"SD", :type=>"purchase", :pre_order=>false}, {:price=>"12.99", :format=>"HD", :type=>"purchase",                                               :pre_order=>false}]}, 
                                                {:source=>"amazon_buy", :display_name=>"Amazon", :link=>"http://www.amazon.com/gp/product/B00CRDKNIM", :formats=>[{:price=>"3.99", :format=>"SD", :type=>"rent", :pre_order=>false}, {:price=>"9.99", :format=>"SD", :type=>"purchase", :pre_order=>false}, {:price=>"4.99", :format=>"HD", :type=>"rent", :pre_order=>false}, {:price=>"12.99", :format=>"HD", :type=>"purchase", :pre_order=>false}]}]
  end  
end 
