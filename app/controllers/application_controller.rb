class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= User.first_post
    end
    helper_method :current_user
end
