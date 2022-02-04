class UserBadgesController < ApplicationController
  before_action :authenticate_user!
end
