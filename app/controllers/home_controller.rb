class HomeController < ApplicationController
  def index
    access_token = ENV['INSTAGRAM_ACCESS_TOKEN']
    
    recent_media = HTTParty.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=#{access_token}")
    @r_media = recent_media["data"]
  end
end
