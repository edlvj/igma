FactoryGirl.define do
  factory :tracking do
    user_id nil
    ig_user nil

    trait :invalid do
      user_id 3
      ig_user_id 3
    end

    initialize_with { new(attributes) }
    to_create do |instance|
      repo = TrackingRepository.new
      repo.create(instance)
    end
  end
end