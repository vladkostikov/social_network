class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topics = Topic.all
  end

  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to '/posts/'.concat(@post.id.to_s)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :topic_id)
  end
end
