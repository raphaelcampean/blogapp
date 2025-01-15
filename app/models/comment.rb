class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :post, optional: true

  belongs_to :parent, class_name: "Comment", optional: true
  has_many :replies, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy

  validates :body, presence: true

  # def commentable_type=(class_name)
  #   super(class_name.constantize.base_class.to_s)
  # end

  # def likes_count
  #   likes.count
  # end

  # def can_reply?
  #   parent_id.nil?
  # end
end
