class SocialMediaPostsController < ApplicationController
  skip_before_action :authorized, only: [:index, :update]

  def index
    @posts=SocialMediaPost.all
    render json: @posts
  end
  
  def create
    @post= SocialMediaPost.create(post_params.merge(user_id: @user.id, likes: 0))
    render json: @post
  end 

  def update
    @post=SocialMediaPost.find(params[:id])
    @post.update({likes: params[:social_media_post][:likes]})
    render json: @post
  end

  private

  def post_params
    params.require(:social_media_post).permit(:message,:featured_image, :liikes)
  end
end
