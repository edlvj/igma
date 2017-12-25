module Web::Controllers::Trackings
  class Create
    include Web::Action
    before :authenticate!

    params do
      required(:ig_user).schema do
        required(:profile_id) { filled? & str? }
        required(:username) { filled? & str? }
        required(:image) { filled? & str? }
      end
    end

    def call(params)
      if params.valid?
        @ig_user_interactor = IgUserInteractor::Create.new(params[:ig_user]).call
        @tracking_interactor = TrackingInteractor::Create.new(ig_user_id: @ig_user_interactor.ig_user.id, user_id: current_user.id).call
        
        if @tracking_interactor.successful?
          flash[:success] = 'Tracking added.' 
        else
          flash[:warning] = 'Tracking already existed.' 
        end
          
        redirect_to routes.new_tracking_path
      else
      	self.status = 422
      end   
    end
  end
end
