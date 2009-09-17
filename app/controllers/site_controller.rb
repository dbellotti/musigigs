class SiteController < ApplicationController
  def index
    @title = "Musi Gigs - Perform or book live music."
  end

  def about
    @title = "About Musi Gigs"
  end

  def help
    @title = "Musi Gigs Help"
  end

end
