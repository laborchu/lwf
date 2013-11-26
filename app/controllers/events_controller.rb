class EventsController < ApplicationController

	before_filter :find_event, :only => [ :show, :edit, :update, :destroy]

	#view list
	def index
		@events = Event.page(params[:page]).per(5)

		respond_to do |format|
		    format.html # index.html.erb
		    format.xml { render :xml => @events.to_xml }
		    format.json { render :json => @events.to_json }
		    format.atom { @feed_title = "My event list" } # index.atom.builder
		end
	end
	#view show
	def show
		# @event = Event.find(params[:id])
	end

	#view new
	def new
		@event = Event.new
	end
	#do create
	def create
		flash[:notice] = "event was successfully created"
		@event = Event.new(event_params)
		if @event.save
			redirect_to events_url
		else
			render :action => :new
		end
	end


	#view edit
	def edit
		# @event = Event.find(params[:id])
	end
	#do update
	def update
		flash[:notice] = "event was successfully updated"
		# @event = Event.find(params[:id])
		if @event.update_attributes(event_params)
			redirect_to events_url(@event)
		else
			render :action => :edit
		end
	end

	def destroy
		flash[:alert] = "event was successfully deleted"
		# @event = Event.find(params[:id])
		@event.destroy
		redirect_to events_url
	end

	protected

	def event_params  
	    params.require(:event).permit(:name , :desc)  
	end  

	def find_event
	  @event = Event.find(params[:id])
	end

end
