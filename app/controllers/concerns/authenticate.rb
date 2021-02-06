module Authenticate
  extend ActiveSupport::Concern

  included do
    include BySession

    before_action :authenticate
  end

  private
    def authenticate
      if authenticate_with_session
        # Great! You're in
      elsif !performed?
        request_session_authentication
      end
    end

    def authenticated(user, by:)
      benchmark "#{authentication_identification(user)} by #{by}" do
        @authenticated_by     = by.to_s.inquiry
        @authenticated_user   = user

        Current.user = user
      end
    end

    def signed_in?
      @authenticated_user != nil
    end

    def authentication_identification(user)
      "Authorized #{user.username}"
    end
end
