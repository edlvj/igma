describe Tracking do
  it 'can be initialized with attributes' do
    ig_user = Tracking.new(user_id: 12, ig_user_id: 34)
    expect(ig_user.user_id).to eq(12)
    expect(ig_user.ig_user_id).to eq(34)
  end
end
