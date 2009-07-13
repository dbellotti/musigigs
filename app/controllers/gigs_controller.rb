class GigsController < ApplicationController

  def index
    @gigs = Gig.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gigs }
    end        
  end

  def search
    'apply for a new gig'
  end

end