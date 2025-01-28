class Report < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  enum reason: { spam: 0, offensive: 1, other: 2 }

  validates :reason, presence: true
end
