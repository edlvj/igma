describe IgComment do
  it 'can be initialized with attributes' do
    ig_comment = IgComment.new(comment_id: '23232323', profile_username: 'test', text: 'text')
    expect(ig_comment.comment_id).to eq('23232323')
    expect(ig_comment.profile_username).to eq('test')
    expect(ig_comment.text).to eq('text')
  end
end
