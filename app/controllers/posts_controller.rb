class PostsController < ApplicationController
  http_basic_authenticate_with name: "pooja", password: "poojasalpekar", except: [:index, :show]
  def new

  end

  def create
    params[:post]
    @post = Post.new(params[:post].permit(:title, :text))

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

end
