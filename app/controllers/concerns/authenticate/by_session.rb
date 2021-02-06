module Authenticate::BySession
  include ActiveSupport::SecurityUtils

  private
    def authenticate_with_session
      if user = User.find_by(id: session[:user_id])
        authenticated user, by: :session
      end
    end

    def request_session_authentication
      redirect_to sign_in_url
    end

    def sign_in(user)
      session[:user_id] = user.id; redirect_to root_url
    end

    def sign_out
      session[:user_id] = nil; redirect_to sign_in_url
    end
end
