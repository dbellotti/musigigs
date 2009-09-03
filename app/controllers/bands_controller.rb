class BandsController < ApplicationController
  before_filter :protect, :except => :index

  # GET /bands
  # GET /bands.xml
  def index
    @bands = Band.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bands }
    end
  end

  # GET /bands/1
  # GET /bands/1.xml
  def show
    @band = Band.find(params[:id])
    if @band
      @title = "Musigigs Band Profile for #{@band.name}"
    else
      flash[:notice] = "No band #{@band.name} at Musigigs!"
      redirect_to hub_url
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @band }
    end
  end

  # GET /bands/new
  # GET /bands/new.xml
  def new
    @user = User.find(session[:user_id])
    @band = Band.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @band }
    end
  end

  # GET /bands/1/edit
  def edit
    @band = Band.find(params[:id])
    @title = "Update #{@band.name}'s information..."
  end

  # POST /bands
  # POST /bands.xml
  def create
    @user = User.find(session[:user_id])
    @band = Band.new(params[:band])
#    @band.name = params[:band][:name]
#    @band.genre = params[:band][:genre]
#    @band.description = params[:band][:description]
    respond_to do |format|
      if @band.save
        @user.bands << @band
        @user.save!
        flash[:notice] = 'Band was successfully created.'
        format.html { redirect_to @band }
        format.xml  { render :xml => @band, :status => :created, :location => @band }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @band.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bands/1
  # PUT /bands/1.xml
  def update
    @band = Band.find(params[:id])

    respond_to do |format|
      if @band.update_attributes(params[:band])
        flash[:notice] = 'Band was successfully updated.'
        format.html { redirect_to(@band) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @band.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.xml
  def destroy
    @band = Band.find(params[:id])
    @band.destroy

    respond_to do |format|
      format.html { redirect_to(hub_url) }
      format.xml  { head :ok }
    end
  end
end
