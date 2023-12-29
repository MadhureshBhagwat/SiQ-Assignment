# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'when creating a comment' do
    let(:comment) { create :comment }

    it 'should be valid comment with all attributes' do
      expect(comment.valid?).to eq(true)
    end

    it 'should be invalid without content' do
      comment.content = nil
      expect(comment).to be_invalid
      expect(comment.errors[:content]).to include("can't be blank")
    end

    it 'should be invalid without a post_id' do
      comment.post_id = nil
      expect(comment).to be_invalid
      expect(comment.errors.full_messages).to include('Post must exist')
    end

    it 'should be invalid without a user_id' do
      comment.user_id = nil
      expect(comment).to be_invalid
      expect(comment.errors.full_messages).to include('User must exist')
    end

    it 'should be valid without a parent_id' do
      comment.parent_id = nil
      expect(comment).to be_valid
    end

    it 'should belong to a parent comment' do
      parent_comment = create(:comment)
      comment.parent_id = parent_comment.id
      expect(comment.parent).to eq(parent_comment)
    end

    it 'should have many replies' do
      reply1 = create(:comment, parent: comment)
      reply2 = create(:comment, parent: comment)
      expect(comment.comments).to match_array([reply1, reply2])
    end
  end
end
