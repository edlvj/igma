describe IgUser do
  it 'can be initialized with attributes' do
    ig_user = IgUser.new(profile_id: 23232323, username: 'username', image: 'image')
    expect(ig_user.profile_id).to eq(23232323)
    expect(ig_user.username).to eq('username')
    expect(ig_user.image).to eq('image')
  end
end
