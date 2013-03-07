namespace :email do

	desc "Sends an email blast alerting the deal is on"
	task :blast, [:header, :body] =>  [:environment] do |t,args|
		header = args[:header]
		body = args[:body]
		
		Subscriber.where( confirmed: true ).each do |subscriber|
			MainMailer.mailing_list_email( subscriber, header, body ).deliver
		end 
	end

end
