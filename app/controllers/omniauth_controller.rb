class OmniauthController < ApplicationController

    def oauth_login
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.user_name = auth['info']['email'].split('@').first
          u.password = SecureRandom.hex
          u.name = auth['info']['name']
          u.email = auth['info']['email']
        end
        
        log_in @user
        redirect_to user_path @user.id
      end
    
 private
    
      def auth
        request.env['omniauth.auth']
      end

end
