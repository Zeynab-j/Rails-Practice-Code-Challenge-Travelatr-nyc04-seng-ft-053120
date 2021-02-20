class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find(params[:id])
    @total_likes = @blogger.posts.sum(:likes)
    @featured_post = @blogger.posts.order("likes DESC").first
    @all_destinations = @blogger.destinations.sort_by do |destination|
      destination.posts.length
    end.uniq.reverse
  end
end
