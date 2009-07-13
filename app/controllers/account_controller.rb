class AccountController < ApplicationController
  def login
    if request.post?
      user = User.authenticate(params[:user_name], params[:password])
      if user
        session[:user_id] = user.id
	      redirect_to(:action => "index")
      else
  	    flash.now[:notice] = "Invalid username/password combination"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

  def index
    @total_users = User.count
    @user = User.find(session[:user_id])
    
    @gigs = booked_events(@user)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gigs }
    end        
  end
  
private  
  
  def booked_events(user)
    @gigs = Gig.find_by_band_title(:all)    
  end

end
