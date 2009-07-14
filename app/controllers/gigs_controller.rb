class GigsController < ApplicationController

  def index
    @gigs = Gig.all
    @user = User.find(session[:user_id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gigs }
    end        
  end

  def search
    @user = User.find(session[:user_id])
    @gigs = Gig.all
  end
  

  def new
    @gig = Gig.new
    @gig.band_title = 'dp fresh'
    @gig.time = Time.now

    respond_to do |format|
      if @gig.save
        flash[:notice] = "#{@gig.band_title} successfully created gig at #{@gig.time}."
        format.html { redirect_to(:action => 'search') }
        format.xml  { render :xml => @gig, :status => :created }
      else
        flash[:notice] = "unable to save, try again?"
        format.html { render :action => "search" }
        format.xml  { render :xml => @gig.errors, :status => :unprocessable_entity }
      end
    end
  end

end
