module Admin
	class UsersController < BaseController
		def index
			@users = User.search(params[:search], params[:search_option]).paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
    		respond_to do |format|
      		  format.html # index.html.erb
      		  format.js 
      		  format.json { render json: @users }
    		end
		end

		def show
			@user = User.find(params[:id])

		    respond_to do |format|
		      format.html # show.html.erb
		      format.json { render json: @user }
		    end
		end

		def new

		end

		def create
			#data = {}	
			#data.merge!( :name => params[:name].upcase, 
			#			 :ic_number => params[:ic_number],
			#			 :email => params[:email],
			#			 :password => params[:password],
			#			 :password_confirmation	=> params[:password_confirmation] )

			@user = User.new(params[:user])

		    respond_to do |format|
		      if @user.save
		        format.html { redirect_to @user, notice: 'User was successfully created.' }
		        format.json { render json: @user, status: :created }
		        #@users = User.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
		    	#render 'index.js'
		      else
		        format.html { render action: "new" }
		        format.json { render json: @user.errors, status: :unprocessable_entity }
		      end
		    end
		end

		def edit

		end

		def update
			if params.has_key?(:password)
				params[:user][:current_password] = params[:current_password]
				@user = UserPassword.find(params[:id])
			else
				@user = User.find(params[:id])
			end
		    respond_to do |format|
		      if @user.update_attributes(params[:user])
		        format.html { redirect_to @user, notice: 'User was successfully updated.' }
		        format.json { head :no_content }
		      else
		        format.html { render action: "edit" }
		        format.json { render json: @user.errors, status: :unprocessable_entity }
		      end
		    end

		end

		def delete_users
			User.delete_all(:id => params[:user])
			#respond_to do |format|
		       #format.html { redirect_to root_url }
		    #   format.json { head :no_content }
		    render_users
		    #end
		end

		def render_users
			@users = User.search(params[:search], params[:search_option]).paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
		    render 'index.js'
		end
	end
end