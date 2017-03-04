FactoryGirl.define do
  factory :message do
    before(:create) do
      create(:group)
      create(:user)
    end

    text  Faker::Name.title
    group
    user
  end
end
