describe IgCommentRepository do
  let(:repository) { described_class.new }
  let(:ig_user_repository) { IgUserRepository.new }
  let(:ig_post_repository) { IgPostRepository.new }
  
  describe '#find_by_comment_id' do
    context 'when comment does not exist' do    
      it { expect(repository.find_by_comment_id('12121')).to be nil }
    end

    context 'when comment exist' do
      before do 
       ig_user = ig_user_repository.create(profile_id: 23232323, username: 'username', image: 'image')
       ig_post = ig_post_repository.create(media_id: '23232323', likes_count: 23, image_url: 'dsdsd', ig_user_id: ig_user.id)
       repository.create(comment_id: '12121', profile_username: 'test', text: 'text', ig_post_id: ig_post.id) 
      end

      it { expect(repository.find_by_comment_id('12121')).to be_a IgComment }
    end
  end
end
