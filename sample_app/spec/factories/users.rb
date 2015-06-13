FactoryGirl.define do
	sequence(:name){ |n| "user#{n}" }
	# sequence(:email){ |n| "user#{n}@example.com" }

	factory :user do
		name
		email { "#{name}@example.com" }
		password "password"
		password_confirmation 'password'
	end
end
