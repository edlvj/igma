module Web::Controllers::Sessions
  class Destroy
    include Web::Action
    before :authenticate!

    def call(params)
      destroy_session
      flash[:success] = 'Successfully logout'
      redirect_to routes.new_session_path	
    end
  end
end
