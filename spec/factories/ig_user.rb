FactoryGirl.define do
  factory :ig_user do
    profile_id '4343434'
    username 'hanumak'
    image 'image'

    trait :invalid do
      name 'testy'
      username nil
      image 'test'
    end

    initialize_with { new(attributes) }
    to_create do |instance|
      repo = IgUserRepository.new
      repo.create(instance)
    end
  end
end