class HomeController < ApplicationController

  def home
    if logged_in?
      @micropost  = current_user.microposts.build if logged_in?
      @user       = current_user
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
