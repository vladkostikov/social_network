class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true

  def self.comments_find(commentable_type, commentable_id)
    Comment.where("commentable_type = ? and commentable_id = ? and parent_id = 0",
                  commentable_type, commentable_id).order('id ASC')
  end

  def self.replies_find(commentable_type, commentable_id)
    Comment.where("commentable_type = ? and commentable_id = ? and parent_id != 0",
                  commentable_type, commentable_id).order('id ASC')
           .group_by{ |comment| comment['parent_id'] }
  end
end
