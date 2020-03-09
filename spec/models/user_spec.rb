require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    user = User.new(
      email: 'aaa@gmail.com',
      first_name: 'aa',
      last_name: 'aaa',
      password: 'aaaa',
      password_confirmation: 'aaaa'
    )

    it 'should save when all fields are valid' do
      expect(user).to be_valid
    end

    it 'should have password' do
      @user = user
      @user.password = nil
      @user.password_confirmation = nil
      expect(@user).to be_invalid
    end

    it 'should have matching password and password confirmation' do
      @user = user
      @user.password_confirmation = nil
      expect(@user).to be_invalid
    end

    it 'should have password of minimum length' do
      @user = user
      @user.password = 'a'
      @user.password_confirmation = 'a'
      expect(@user).to be_invalid
    end

    it 'should not allow duplicate emails' do
      User.create!(
        email: 'aaa@gmail.com',
        first_name: 'aa',
        last_name: 'aaa',
        password: 'aaaa',
        password_confirmation: 'aaaa'
      )
      expect(user).to be_invalid
    end

    it 'should not allow duplicate emails with upper/lowercases' do
      User.create!(
        email: 'AAA@gmail.com',
        first_name: 'aa',
        last_name: 'aaa',
        password: 'aaaa',
        password_confirmation: 'aaaa'
      )
      expect(user).to be_invalid
    end

    it 'should have email' do
      @user = user
      @user.email = nil
      expect(@user).to be_invalid
    end

    it 'should have firstname' do
      @user = user
      @user.first_name = nil
      expect(@user).to be_invalid
    end

    it 'should have lastname' do
      @user = user
      @user.last_name = nil
      expect(@user).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do

    it 'should authenticate with valid email and password' do
      User.create!(
        email: 'aaa@gmail.com',
        first_name: 'aa',
        last_name: 'aaa',
        password: 'aaaa',
        password_confirmation: 'aaaa'
      )

      @user = User.authenticate_with_credentials('aaa@gmail.com', 'aaaa')
      expect(@user).to be_truthy
    end

    it 'should return nil with invalid email and password' do
      User.create!(
        email: 'aaa@gmail.com',
        first_name: 'aa',
        last_name: 'aaa',
        password: 'aaaa',
        password_confirmation: 'aaaa'
      )

      @user = User.authenticate_with_credentials('bbb@gmail.com', 'bbbb')
      expect(@user).to be_nil
    end

    it 'should authenticate with valid email wrapped in whitespace' do
      User.create!(
        email: 'aaa@gmail.com',
        first_name: 'aa',
        last_name: 'aaa',
        password: 'aaaa',
        password_confirmation: 'aaaa'
      )

      @user = User.authenticate_with_credentials(' aaa@gmail.com ', 'aaaa')
      expect(@user).to be_truthy
    end

    it 'should authenticate with valid email with upper/lowercases' do
      User.create!(
        email: 'aaa@gmail.com',
        first_name: 'aa',
        last_name: 'aaa',
        password: 'aaaa',
        password_confirmation: 'aaaa'
      )

      @user = User.authenticate_with_credentials('AAA@gmail.com', 'aaaa')
      expect(@user).to be_truthy
    end
  end
end