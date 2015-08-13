FactoryGirl.define do
  factory :beer1 do
    name "beer1"
    rating 1
    ibu 10
    abv 5
    description "beer1desc"
  end

  factory :beer2 do
    name "beer2"
    rating 2
    ibu 20
    abv 6
    description "beer2desc"
  end
end
