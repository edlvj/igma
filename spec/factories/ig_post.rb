FactoryGirl.define do
  factory :ig_post do
    media_id '4343434'
    likes_count 12
    image_url 'image'
    text 'text'
    ig_user_id nil

    initialize_with { new(attributes) }
    to_create do |instance|
      repo = IgPostRepository.new
      repo.create(instance)
    end
  end
end