describe UserRepository do
  let(:repository) { described_class.new }

  describe '#find_by_email' do   
    context 'when email does not exist' do    
      it { expect(repository.find_by_email('test@test.com')).to be nil }
    end

    context 'when email exist' do
      before { create(:user, email: 'test@test.com') }
      it { expect(repository.find_by_email('test@test.com')).to be_a User }
    end
  end
end
