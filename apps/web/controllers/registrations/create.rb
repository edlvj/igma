module Web::Controllers::Registrations
  class Create
    include Web::Action
    before :require_no_authenticate!
    
    params do
      required(:user).schema do
        required(:name) { filled? & str? & format?(/\A[A-z0-9_-]{4,64}\Z/) }
        required(:password) { filled? & str? & size?(6...12) }
        required(:email) { filled? & str? & format?(/@/) }
      end
    end

    def call(params)
      if params.valid?
        @user_interactor = UserInteractor::Create.new(params[:user]).call

        if @user_interactor.successful?
          flash[:success] = 'Successfully Sign Up.'
        else
          flash[:warning] = 'Email already exist.'
        end  

        redirect_to routes.new_session_path
      else
        self.status = 422
      end
    end
  end
end