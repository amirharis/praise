class UserController < ApplicationController
	#respond_to :json
	def profile
		respond_to do |format|
	  		format.html # index.html.erb
	  		format.json { render json: current_user }
		end
	end

	def update_profile 
		if params.has_key?(:password)
			@user = UserPassword.find(current_user.id)
		else
			@user = User.find(current_user.id)
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
end
