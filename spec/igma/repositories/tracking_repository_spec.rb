describe TrackingRepository do
  let(:repository) { described_class.new }
  let(:user_repository) { UserRepository.new }
  let(:ig_user_repository) { IgUserRepository.new }

  describe '#find_by_atrributes' do   
    context 'when attributes nil does not exist' do
      let(:tracking) { build(:tracking, :invalid) }
      it { expect(repository.find_by_atrributes(tracking)).to be nil }
    end

    context 'when profile_id exist' do

      before do
        user = user_repository.create(name: 'Batko', email: 'test@test.com', password: 'test')
        ig_user = ig_user_repository.create(profile_id: 23232323, username: 'username', image: 'image') 
        repository.create(user_id: user.id, ig_user_id: ig_user.id)
        @tracking = Tracking.new(user_id: user.id, ig_user_id: ig_user.id) 
      end

      it { expect(repository.find_by_atrributes(@tracking)).to be_a Tracking }
    end
  end

  describe '#find_with_ig_users_by_user_id' do
    context 'when attributes nil does not exist' do
      it { expect(repository.find_with_ig_users_by_user_id(2)).to eq [] }
    end

    context 'when attributes nil does not exist' do
      before do
        @user = user_repository.create(name: 'Batko', email: 'test@test.com', password: 'test')
        ig_user = ig_user_repository.create(profile_id: 23232323, username: 'username', image: 'image') 
        @tracking = repository.create(user_id: @user.id, ig_user_id: ig_user.id)
      end  
      it { expect(repository.find_with_ig_users_by_user_id([@user.id])).to eq [@tracking] }
    end
  end  
end
