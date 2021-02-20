FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Categoría #{n}"}
    description {Faker::Lorem.sentence}
  end
end
