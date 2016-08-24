class Movie < OpenStruct
  def self.service
    GuideBoxService.new
  end
end 