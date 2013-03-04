class EventsController < ApplicationController
	before_filter :require_admin

	def new
		@event = Event.new
		@events = Event.all
		render layout: "admin"
	end
	def create
		event_attrs = convert_date_params( params )
		@event = Event.new( event_attrs )
		if @event.save
			#Post to social media
			redirect_to new_event_path, notice: "Event was created"
		else
			render "new", layout: "admin"
		end
	end

	def edit
		@event = Event.find( params[:id] )
		@events = Event.all
		render layout: "admin"
	end
	def update
		event_attrs = convert_date_params( params )
		@event = Event.find( params[:id] )
		if @event.update_attributes( event_attrs )
			redirect_to new_event_path, notice: "Event Sucsessfully created"
		else
			render "edit", layout: "admin"
		end
	end
	
	def destroy
		Event.find( params[:id] ).destroy
		redirect_to new_event_path, notice: "Event has been eradicated at your bidding my leige"
	end

	private
	def convert_date_params( params )
		params = params[:event]
		params[:date] = Date.new( params["date(1i)"].to_i, params["date(2i)"].to_i, params["date(3i)"].to_i )
		{ heading: params[:heading], date: params[:date] }
	end

end
