class VoidsController < ApplicationController
  def index
    @voids=Void.all
    render json:@voids, include: [:mood]
  end

def create
  @void=Void.create(name: params[:name], message: params[:message], mood_id: params[:mood])
  render json: @void, status: :created
end

def destroy
  @void=Void.find(params[:id])
  @void.destroy
end
end
