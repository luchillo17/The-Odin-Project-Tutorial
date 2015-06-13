require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) { FactoryGirl.create(:user) }

	let(:valid_addresses) do
		%w[
			user@example.com
			USER@foo.COM
			A_US-ER@foo.bar.org
      first.last@foo.jp
      alice+bob@baz.cn
		]
	end

	let(:invalid_addresses) do
		%w[
			user@example,com
			user@example..com
			USER_at_foo.COM
			user.name@example.
			foo@bar..com
			foo@bar_baz.com
			foo@bar+baz.com
		]
	end

	describe 'with valid params' do
		it 'is valid' do
			expect(user).to be_valid
		end
	end

	describe 'name validation' do
		it 'name should be present' do
			user.name = ' '
			expect(user).not_to be_valid
		end

		it 'name should be short' do
			user.name = 'a'*51
			expect(user).not_to be_valid
		end
	end

	describe 'email validation' do
		it 'should be present' do
			user.email = ' '
			expect(user).not_to be_valid
		end

		it 'should be short' do
			user.email = 'a' * 244 + '@example.com'
			expect(user).not_to be_valid
		end

		it 'should save as downcase' do
			user = FactoryGirl.build(:user)
		  email = user.email.upcase!.dup
		  user.save
		  expect(User.first.email).to eq(email.downcase)
		end

		it 'should accept valid addresses' do
			valid_addresses.each do |valid_address|
				user.email = valid_address
				expect(user).to be_valid,"#{valid_address.inspect} should be valid."
			end
		end

		it 'should reject invalid addresses' do
			invalid_addresses.each do |invalid_address|
				user.email = invalid_address
				expect(user).not_to be_valid, "#{invalid_address.inspect} should be invalid."
			end
		end

		it 'should be unique' do
		  duplicate_user = user.dup
		  duplicate_user.email.upcase!
		  user.save
		  expect(duplicate_user).not_to be_valid
		end
	end

	describe 'password validation' do
	  it 'should be present (nonblank)' do
	    user.password = ' '*6
	    expect(user).not_to be_valid
	  end

	  it 'should have minimum length' do
	    user.password = 'a' * 5
	    expect(user).not_to be_valid
	  end
	end
end
