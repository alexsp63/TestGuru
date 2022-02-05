class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = Badge.all
  end

  def gained_badges
    @badges = current_user.badges
    render :index
  end
end
