FactoryGirl.define do
  factory :ig_comment do
    comment_id '4343434'
    profile_username 'hanumak'
    text 'text'
    ig_post_id { create(:ig_post).id }

    initialize_with { new(attributes) }
    
    to_create do |instance|
      repo = IgCommentRepository.new
      repo.create(instance)
    end
  end
end