module Web
  module Authentication
    def self.included(action)
      action.class_eval do
        expose :logged
      end
    end

    private
    
    def authenticate!
      unless authenticated?
        redirect_to routes.new_session_path
      end
    end

    def require_no_authenticate!
      if authenticated?
        redirect_to request.referrer || routes.root_path
      end
    end

    def authenticated?
      !!current_user
    end

    def logged
      session[:user_id].nil? ? false : true
    end  

    def set_session(user_id)
      session[:user_id] = user_id
    end

    def destroy_session
      session[:user_id] = nil
    end

    def current_user
      @current_user ||= UserRepository.new.find(session[:user_id])
    end
  end
end