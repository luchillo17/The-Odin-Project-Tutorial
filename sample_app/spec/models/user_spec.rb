require 'rails_helper'

RSpec.describe User, type: :model, focus: false do

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
			foo@bar_baz.com
			foo@bar+baz.com
		]
	end

	before :each do
		@user = User.new	name:  'luchillo',
											email: 'luchillo17@gmail.com', 
											password: 'belorofonte', 
											password_confirmation: 'belorofonte'
	end

	context "Attribute validation" do
		describe 'with valid attributes' do
			it 'should be valid' do
				expect(@user).to be_valid
			end

			it 'email should have valid format' do
				valid_addresses.each do |valid_address|
					@user.email = valid_address
					expect(@user).to be_valid("#{valid_address.inspect} should be valid")
				end
			end
		end

		describe 'with invalid attributes' do
			it 'name should not be blank' do
				@user.name = "  "
				expect(@user).not_to be_valid
			end

			it 'name should not be too long' do
				@user.name = "a"*51
				expect(@user).not_to be_valid
			end
			
			it 'email should not be blank' do
				@user.email = "  "
				expect(@user).not_to be_valid
			end

			it 'email should not be too long' do
				@user.email = "a"*246 +"@gmail.com"
				expect(@user).not_to be_valid
			end

			it 'email should not have invalid format' do
				invalid_addresses.each do |invalid_address|
					@user.email = invalid_address
					expect(@user).not_to be_valid("#{invalid_address.inspect} should be invalid")
				end
			end

			it 'email should be unique' do
				duplicated_user = @user.dup
				duplicated_user.email = duplicated_user.email.upcase
				@user.save
				expect(duplicated_user).not_to be_valid
			end

			it 'password should be present (nonblank)' do
				@user.password = @user.password_confirmation = ' '*6
				expect(@user).not_to be_valid
			end

			it 'password should have minimum length' do
				@user.password = @user.password_confirmation = 'a'*5
				expect(@user).not_to be_valid
			end
		end
	end
end
