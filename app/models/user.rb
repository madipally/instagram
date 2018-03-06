class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:instagram]
         
  def self.instagram(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.full_name = auth['extra']['raw_info']['full_name']
      user.image = auth['extra']['raw_info']['profile_picture']
    end
  end
end
