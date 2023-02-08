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

  def edit
    @topics = Topic.all
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.save

    redirect_to '/posts/'.concat(@post.id.to_s)
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to '/posts/'.concat(@post.id.to_s)
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :topic_id)
  end
end
