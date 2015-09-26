class HomepageController < ApplicationController
  layout 'landing_page'

  def index
  end

  def robots
    env = request.host["herokuapp"] ? "staging" : "production"
    robots = File.read(Rails.root + "config/robots.#{env}.txt")
    render :text => robots, :layout => false, :content_type => "text/plain"
  end
end
