class MoodsController < ApplicationController
  def index
    @moods=Mood.all 
    render json: @moods
end

def create
  @mood=Mood.create(feeling: params[:feeling])
  render json: @mood, status: :created
end

def destroy
  @mood=Mood.find(params[:id])
  @mood.destroy
end
end