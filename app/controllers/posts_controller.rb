class PostsController < ApplicationController
  before_action :authenticate_user,

  def index
        @posts = Post.all.order(created_at: 'desc')
  end
  def show
  @post = Post.find_by(id: params[:id])
end

def new
  @post = Post.new
end

def create
  #render plain: params[:post].inspect
  @post = Post.new(params_permit)
  if @post.save
  # redirect
  redirect_to posts_path
else
  render "new"
end
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
  if @post.update(params_permit)
    redirect_to posts_path
  else
    render 'edit'
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
end

private
  def params_permit
    params.require(:post).permit(:content)
  end

end
