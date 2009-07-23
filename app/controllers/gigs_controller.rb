class GigsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @gigs = Gig.search_by_band(@user.entity_title)      

    @gig_search = Gig.search_by_band(params[:search])      
     
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gigs }
    end        
  end

  def search
    @user = User.find(session[:user_id])
    @gigs = Gig.search_by_date(params[:search]) 
  end

  # GET /gigs/1
  # GET /gigs/1.xml
  def show
    @gig = Gig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gig }
    end
  end
  
  # GET /gigs/new
  # GET /gigs/new.xml
  def new
    @gig = Gig.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gig }
    end
  end  
  
  # GET /gigs/1/edit
  def edit
    @gig = Gig.find(params[:id])
  end
  
  # POST /gigs/new
  # POST /gigs/new.xml
  def create
    @user = User.find(session[:user_id])
    @gig = Gig.new
    @gig.band_title = @user.entity_title
    @gig.time = Time.now

    respond_to do |format|
      if @gig.save
        flash[:notice] = "#{@gig.band_title} successfully created gig at #{@gig.time}."
        format.html { redirect_to(:action => 'index') }
        format.xml  { render :xml => @gig, :status => :created }
      else
        flash[:notice] = "unable to save, try again?"
        format.html { render :action => 'new' }
        format.xml  { render :xml => @gig.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /gigs/1
  # PUT /gigs/1.xml
  def update
    @user = User.find(params[:id])
    @gig = Gig.find(params[:id])

    respond_to do |format|
      if @gig.update_attributes(params[:gig])
        flash[:notice] = "#{@gig.band_title} successfully updated a gig."
        format.html { redirect_to(:action => 'index') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gig.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gigs/1
  # DELETE /gigs/1.xml
  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy

    respond_to do |format|
      format.html { redirect_to(gigs_url) }
      format.xml  { head :ok }
    end
  end

end
