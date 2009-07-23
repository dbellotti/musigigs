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
    if session[:user_id] == nil
      redirect_to(:action => 'login')
    else
      @user = User.find(session[:user_id])      
      @total_gigs = Gig.search_by_band(@user.entity_title)
      @gigs = Gig.find(:all)
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @total_gigs }
      end        
    end
  end
  
end
