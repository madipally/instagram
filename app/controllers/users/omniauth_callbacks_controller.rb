class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def instagram
        @user = User.instagram(request.env["omniauth.auth"])
        if @user.persisted?
         sign_in_and_redirect @user
        else
         redirect_to new_user_registration_url
        end
    end
    
    def failure
      redirect_to root_path
    end
end
