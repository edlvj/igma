describe IgPost do
  it 'can be initialized with attributes' do
    ig_post = IgPost.new(media_id: '23232323', likes_count: 23, text: 'text')
    expect(ig_post.media_id).to eq('23232323')
    expect(ig_post.likes_count).to eq(23)
    expect(ig_post.text).to eq('text')
  end
end
