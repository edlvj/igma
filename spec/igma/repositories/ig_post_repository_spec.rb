describe IgPostRepository do
  let(:repository) { described_class.new }
  let(:ig_user_repository) { IgUserRepository.new }

  describe '#find_by_comment_id' do   
    context 'when id does not exist' do    
      it { expect(repository.find_with_comment_by_id(1)).to be nil }
    end

    context 'when id exist' do
      before do
        ig_user = ig_user_repository.create(profile_id: 23232323, username: 'username', image: 'image')
        @ig_post = repository.create(media_id: '23232323', likes_count: 23, image_url: 'dsdsd', ig_user_id: ig_user.id)
      end 

      it { expect(repository.find_with_comment_by_id(@ig_post.id)).to be_a IgPost }
    end
  end

  describe '#find_by_media_id' do
    context 'when media_id does not exist' do    
      it { expect(repository.find_by_media_id('2121')).to be nil }
    end

    context 'when media_id exist' do
      before do
        ig_user = ig_user_repository.create(profile_id: 23232323, username: 'username', image: 'image')
        @ig_post = repository.create(media_id: '23232323', likes_count: 23, image_url: 'dsdsd', ig_user_id: ig_user.id)
      end 
      
      it { expect(repository.find_by_media_id(@ig_post.media_id)).to be_a IgPost }
    end
  end

  describe '#find_by_ig_user_ids' do
    context 'when users_ids does not exist' do    
      it { expect(repository.find_by_ig_user_ids([21])).to eq [] }
    end

    context 'when users_ids exist' do
      before do
        @ig_user = ig_user_repository.create(profile_id: 23232323, username: 'username', image: 'image')
        @ig_post = repository.create(media_id: '23232323', likes_count: 23, image_url: 'dsdsd', ig_user_id: @ig_user.id)
      end 
      
      it { expect(repository.find_by_ig_user_ids([@ig_user.id])).to eq [@ig_post] }
    end
  end
end