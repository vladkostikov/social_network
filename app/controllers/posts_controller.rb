class PostsController < ApplicationController
  def topic
    @topic = Topic.find_by(alias: params[:topic])
    @posts = @topic.posts
    render 'index'
  end

  def index
    @posts = Post.page params[:page]
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
    if @post.save
      redirect_to '/posts/'.concat(@post.id.to_s)
    else
      @topics = Topic.all
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to '/posts/'.concat(@post.id.to_s)
    else
      @topics = Topic.all
      render 'edit'
    end
  end

  private

  def post_params
    params[:post][:topic_id] = params[:post][:topic]
    params.require(:post).permit(:title, :body, :topic_id)
  end
end
