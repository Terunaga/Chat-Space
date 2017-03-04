FactoryGirl.define do
  password = Faker::Internet.password(6)

  factory :user do
    name                  Faker::Name.name
    email                 Faker::Internet.email
    password              password
    password_confirmation password

    after(:create) do |user|
      user.groups << create(:group)
    end
  end
end
