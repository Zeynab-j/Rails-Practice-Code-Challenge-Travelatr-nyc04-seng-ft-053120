class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
    @featured_post = @destination.posts.order("likes DESC").first
    @recent_posts = @destination.posts.order("created_at DESC").limit(5)
    @bloggers_average_age = @destination.bloggers.average(:age)
  end
end
