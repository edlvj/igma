describe IgUserRepository do
  let(:repository) { described_class.new }

  describe '#find_by_profile_id' do   
    context 'when profile_id does not exist' do    
      it { expect(repository.find_by_profile_id(1)).to be nil }
    end

    context 'when profile_id exist' do
      before { repository.create(profile_id: 23232323, username: 'username', image: 'image') }
      it { expect(repository.find_by_profile_id(23232323)).to be_a IgUser }
    end
  end
end
