# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'while creating a user' do
    let(:user) { create :user }

    it 'should be valid user with all atrributes' do
      expect(user.valid?).to eq(true)
    end

    it 'should be invalid without a first_name' do
      user.first_name = nil
      expect(user).to be_invalid
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it 'should be invalid without a last_name' do
      user.last_name = nil
      expect(user).to be_invalid
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it 'should be invalid without a city' do
      user.city = nil
      expect(user).to be_invalid
      expect(user.errors[:city]).to include("can't be blank")
    end

    it 'should be invalid without a address' do
      user.address = nil
      expect(user).to be_invalid
      expect(user.errors[:address]).to include("can't be blank")
    end

    it 'should be invalid without a email' do
      user.email = nil
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'should be invalid without a password' do
      user.password = nil
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end
