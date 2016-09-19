class Admin::LandingsController < Admin::BaseController

  def index
    @users = User.all
  end

end
