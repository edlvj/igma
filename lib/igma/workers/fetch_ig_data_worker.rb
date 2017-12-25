class FetchIgDataWorker
  include Sidekiq::Worker

  def perform
    @ig_users = IgUserRepository.new.all
    IgPostInteractor::Fetch.new(@ig_users).call
  end
end