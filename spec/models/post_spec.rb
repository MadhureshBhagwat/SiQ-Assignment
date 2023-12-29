# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'when creating a post' do
    let(:post) { create :post }

    it 'should be valid post with all atrributes' do
      expect(post.valid?).to eq(true)
    end

    it 'should be invalid without a title' do
      post.title = nil
      expect(post).to be_invalid
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'should be invalid without a content' do
      post.content = nil
      expect(post).to be_invalid
      expect(post.errors[:content]).to include("can't be blank")
    end

    it 'should be invalid without a user_id' do
      post.user_id = nil
      expect(post).to be_invalid
      expect(post.errors.full_messages).to include('User must exist')
    end
  end
end
