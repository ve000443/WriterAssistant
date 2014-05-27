FactoryGirl.define do
  factory :chapter do
  	sequence(:number) { |n| "Test Chapter #{n}" }
    sequence(:title) 	{ |n| "Title #{n}"}
  end

  factory :character do
  	sequence(:name) { |n| "Character #{n}"}
  end

  factory :scene do
  	sequence(:location) { |n| "Location #{n}"}
  	sequence(:period) 	{ |n| "Period #{n}"}
  	sequence(:content) 	{ |n| "Content #{n}"}
  end
end