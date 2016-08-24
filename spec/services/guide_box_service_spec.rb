require 'rails_helper'

describe "can retrive movie info from guidebox api" do 
  it 'has proper attributes' do 
    service = GuideBoxService.new 
    response   = service.get_movie

    expect(response).to eq ""
  end 
end 
