class SiteController < ApplicationController
  def index
    @title = "Welcome to Musigigs!"
  end

  def about
    @title = "About Musigigs"
  end

  def help
    @title = "Musigigs Help"
  end

end
