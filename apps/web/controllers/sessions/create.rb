module Web::Controllers::Sessions
  class Create
    include Web::Action
    include Hanami::Action::Session
    before :require_no_authenticate!
    
    params do
      required(:session).schema do
        required(:email) { filled? & str? & format?(/@/) }
        required(:password) { filled? & str? & size?(6...12) }
      end
    end

    def call(params)
    	if params.valid?
        @user = UserRepository.new.find_by_email(params[:session][:email])

        if @user && @user.user_password?(params[:session][:password])
          set_session(@user.id)
          flash[:success] = 'Successfully sign in'
          redirect_to routes.path(:posts)
        else 
          flash[:warning] = 'Email or password incorrect'
          @user = nil
        end
      else
        self.status = 422
      end
    end
  end
end
