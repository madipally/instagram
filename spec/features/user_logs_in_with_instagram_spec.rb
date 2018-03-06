require 'rails_helper'

RSpec.feature "user logs in" do
   scenario "using instagram" do
       stub_ominauth
       visit root_path
       expect(page).to have_link("Sign in with Instagram")
       click_link "Sign in with Instagram"
       expect(page).to have_css("img[src*='https://scontent.cdninstagram.com/vp/212c1cb20df0ad56f25ec18aab2edec8/5B29057D/t51.2885-19/s150x150/28150915_175361483249243_8759529780933558272_n.jpg']")
   end
end

def stub_ominauth
  OmniAuth.config.test_mode = true
  
  OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
      provider: "instagram",
      uid: "12345678910",
      extra: {
          raw_info: {
              fullname: "Naveen Kumar",
              profile_picture: "https://scontent.cdninstagram.com/vp/212c1cb20df0ad56f25ec18aab2edec8/5B29057D/t51.2885-19/s150x150/28150915_175361483249243_8759529780933558272_n.jpg"
          }
      },    
      credentials: {
          token: "password",
          expires: DateTime.now,
      }
  })
end