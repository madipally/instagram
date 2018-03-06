require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates from oauth has" do
    auth = {
        provider: "instagram",
        uid: "12345678",
        full_name: "Naveen Kumar",
        image: "abc.jpg"
    }
    
    User.first_or_create(auth)
    new_user = User.first
    
    expect(new_user.provider).to eq("instagram")
    expect(new_user.uid).to eq("12345678")
    expect(new_user.full_name).to eq("Naveen Kumar")
    expect(new_user.image).to eq("abc.jpg")
  end
end
