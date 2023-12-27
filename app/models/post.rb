# frozen_string_literal: true

# define Post model class
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true
  # default_scope {order(created_at: :desc)}
  scope :recent_first, -> { order(created_at: :desc) }
end
