# frozen_string_literal: true

# define Comment model class
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :comments, foreign_key: :parent_id

  validates :content, presence: true
end
