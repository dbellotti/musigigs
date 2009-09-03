class ProfileController < ApplicationController
  def index
    @title = "Musigigs Profile"
  end

  def show
    @hide_edit_links = true
    screen_name = params[:screen_name]
    @user = User.find_by_screen_name(screen_name)
    if @user
      @title = "Musigigs Profile for #{screen_name}"
      @spec = @user.spec ||= Spec.new
      @bands = @user.bands
      @venues = @user.venues
    else
      flash[:notice] = "No user #{screen_name} at Musigigs!"
      redirect_to :action => "index"
    end
  end

end
