FactoryBot.define do
  factory :user_favorite do
    user_id nil
    favorite_type 'Sport' # Sport or League
    favorite_id nil
  end
end
