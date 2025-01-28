class Post < ApplicationRecord
  has_rich_text :body
  
  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
end
