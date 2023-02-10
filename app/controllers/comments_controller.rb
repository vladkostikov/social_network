class CommentsController < ApplicationController
  def create
    instance = correct_instance
    @comment = instance.comments.new(comment_params)
    if @comment.save
      new_comment_path = polymorphic_path(instance).concat("#comment_#{@comment.id}")
      redirect_to new_comment_path
    end
  end

  private

  def correct_instance
    return Post.find(params[:comment][:post_id]) if params[:comment][:post_id]
  end

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
