module Web::Controllers::Trackings
  class Destroy
    include Web::Action
    before :authenticate!

    params do
      required(:id) { filled? }
    end

    def call(params)
      if params.valid?
        tracking_repo = TrackingRepository.new
        
        if tracking_repo.find(params[:id])
          tracking_repo.delete(params[:id])
          flash[:success] = 'Tracking deleted'
        else
          flash[:danger] = 'Wrong tracking id'
          self.status = 422
        end

        redirect_to routes.path(:trackings)	
      else
        self.status = 422
      end
    end
  end
end
