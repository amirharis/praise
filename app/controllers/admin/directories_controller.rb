module Admin
	class DirectoriesController < BaseController
		def index

		end

		def sectors
			@sectors = Sector.all
    		respond_to do |format|
      		  format.html # index.html.erb
      		  format.json { render json: @sectors }
    		end
		end

		def divisions
			#if params.has_key?(:sector_id)
			unless params[:sector_id].blank?
				@divisions = Division.where(:sector_id => params[:sector_id])
			else
				@divisions = Division.all
			end

    		respond_to do |format|
      		  format.html # index.html.erb
      		  format.json { render json: @divisions }
    		end
		end

		def sections
			#if params.has_key?(:sector_id)
			unless params[:division_id].blank?
				@sections = Section.where(:division_id => params[:division_id])
			else
				@sections = Section.all
			end

    		respond_to do |format|
      		  format.html # index.html.erb
      		  format.json { render json: @sections }
    		end
		end

		def units
			#if params.has_key?(:sector_id)
			unless params[:section_id].blank?
				@units = Unit.where(:section_id => params[:section_id])
			else
				@units = Unit.all
			end

    		respond_to do |format|
      		  format.html # index.html.erb
      		  format.json { render json: @units }
    		end
		end

		def create_sector
			@directory = Sector.new(params[:directory])

		    respond_to do |format|
		      if @directory.save
		        format.html { redirect_to @directory, notice: 'User was successfully created.' }
		        format.json { render json: @directory, status: :created }
		      else
		        format.html { render action: "new" }
		        format.json { render json: @directory.errors, status: :unprocessable_entity }
		      end
		    end
		end

		def create_division
			@directory = Division.new(params[:directory])

		    respond_to do |format|
		      if @directory.save
		        format.html { redirect_to @directory, notice: 'User was successfully created.' }
		        format.json { render json: @directory, status: :created }
		      else
		        format.html { render action: "new" }
		        format.json { render json: @directory.errors, status: :unprocessable_entity }
		      end
		    end
		end

		def create_section
			@directory = Section.new(params[:directory])

		    respond_to do |format|
		      if @directory.save
		        format.html { redirect_to @directory, notice: 'User was successfully created.' }
		        format.json { render json: @directory, status: :created }
		      else
		        format.html { render action: "new" }
		        format.json { render json: @directory.errors, status: :unprocessable_entity }
		      end
		    end
		end

		def create_unit
			@directory = Unit.new(params[:directory])

		    respond_to do |format|
		      if @directory.save
		        format.html { redirect_to @directory, notice: 'User was successfully created.' }
		        format.json { render json: @directory, status: :created }
		      else
		        format.html { render action: "new" }
		        format.json { render json: @directory.errors, status: :unprocessable_entity }
		      end
		    end
		end
	end
end