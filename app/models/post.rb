class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments, as: :commentable

  validates :title, presence: true, length: { maximum: 300 }
  validates :body, presence: true
end
