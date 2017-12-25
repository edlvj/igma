require 'bcrypt'

FactoryGirl.define do
  factory :user do
    name 'testy'
    email 'test@test.com'
    password 'test34'

    trait :invalid do
      name 'testy'
      email 't'
      password 'test'
    end

    initialize_with { new(attributes) }
    to_create do |instance|
      password = BCrypt::Password.create(instance.password)
      UserRepository.new.create(name: instance.name, email: instance.email, password: password)
    end
  end
end