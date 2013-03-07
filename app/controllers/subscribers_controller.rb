class SubscribersController < ApplicationController

	before_filter :require_admin, only: [:compose, :mail]

	def create
		subscriber = Subscriber.create( params[:subscriber] )
		MainMailer.confirm_signup_email(subscriber).deliver
		redirect_to root_path, notice: "Thank you for your interest we have sent an email for verification purposes. Please open it and click confirm."
	end

	def confirm
		subscriber = Subscriber.where( key: params[:key] ).first
		if subscriber
			subscriber.confirmed = true
			subscriber.save
			redirect_to root_path, notice: "Thank you. You are now confirmed and will be recieving updates"
		else
			redirect_to root_path, notice: "Sorry we were unable to find a subscriber with that key."
		end
	end

	def unsubscribe
		subscriber = Subscriber.where( key: params[:key] ).first
		subscirber.destroy
		redirect_to root_path, notice: "You will no longer be recieving emails from this mailing list. Thank you for the time we had together"
	end

	def destroy
		Subscriber.find( params[:id] ).destroy
		redirect_to compose_subscribers_path
	end

	def compose
		@subscribers = Subscriber.all
		render layout: "admin"
	end

	def mail
		# system "(rake 'email:blast[#{params[:message_header]},#{params[:message_body].gsub(',','').gsub('"','').gsub("'",'')}]' > /dev/null ) &"		
		system "(rake 'email:blast[#{params[:message_header]},#{params[:message_body].gsub(',','').gsub('"','').gsub("'",'')}]' >> /webservices/rake_log.txt ) &"		
		redirect_to compose_subscribers_path
	end

end
