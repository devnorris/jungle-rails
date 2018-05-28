require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

      subject { User.create(
        first_name: 'Devon',
        last_name: 'Norris',
        email: 'devon@gmail.com',
        password: 'lost123',
        password_confirmation: 'lost123'
        )}

    it 'is valid if it has a first_name, last_name, email, password and password_confirmation' do
      expect(subject).to be_valid
      puts subject.errors.full_messages
    end

    it 'requires a first_name' do
      subject.first_name = nil
      expect(subject).not_to be_valid
      expect(subject.errors).to have_key(:first_name)
      puts subject.errors.full_messages
    end

    it 'requires a last_name' do
      subject.last_name = nil
      expect(subject).not_to be_valid
      expect(subject.errors).to have_key(:last_name)
      puts subject.errors.full_messages
    end

    it 'requires a email' do
      subject.email = nil
      expect(subject).not_to be_valid
      expect(subject.errors).to have_key(:email)
      puts subject.errors.full_messages
    end

    it 'is not valid if email is already taken' do
      subject.save
      user = User.create(
        first_name: 'James',
        last_name: 'Peach',
        email: 'devon@gmail.com',
        password: 'cool',
        password_confirmation: 'cool'
      )
      expect(user).not_to be_valid
      puts user.errors.full_messages
    end

    it 'is not valid if password and password_confirmation do not match' do
      subject.password = 'test'
      expect(subject).not_to be_valid
      puts subject.errors.full_messages
    end

    it 'is not valid if password is less then 6 characters' do
      subject.password = 'test'
      subject.password_confirmation = 'test'
      expect(subject).not_to be_valid
      puts subject.errors.full_messages
    end

  end

  describe '#authenticate_with_credentials' do

    subject { User.create(
      first_name: 'James',
      last_name: 'Norris',
      email: 'devon@gmail.com',
      password: 'lost123',
      password_confirmation: 'lost123'
    )}

    it 'returns true if user was authinticated' do
      subject.save
      user = User.authenticate_with_credentials('devon@gmail.com', 'lost123')
      expect(user).to be_truthy
    end

    it 'returns true if user email has whitespace around it' do
      subject.save
      user = User.authenticate_with_credentials(' devon@gmail.com ', 'lost123')
      expect(user).to be_truthy
    end

    it 'returns true if user email has whitespace around it' do
      subject.save
      user = User.authenticate_with_credentials('DeVoN@gmAil.coM', 'lost123')
      expect(user).to be_truthy
    end

  end


end


