FactoryGirl.define do
  factory :user do
    secuence.name{ |n| "user#{n}" }
		secuence.email{ |n| "user#{n}@example.com" }
		password "password"
  end

end
