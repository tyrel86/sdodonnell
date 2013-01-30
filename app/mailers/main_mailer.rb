class MainMailer < ActionMailer::Base
  default from: "sd@sdodonnell.com"
	def test_email
    mail(:to => "tyrelrichey@gmail.com", :subject => "Welcome to My Awesome Site")
  end
	def confirm_signup_email( subscriber )
		@subscriber = subscriber
    mail(:to => subscriber.email, :subject => "Confirmation of S.D. O'Donnell's Mailing list")
  end
	def mailing_list_email( subscriber )
		@subscriber = subscriber
    mail(:to => subscriber.email, :subject => "News from S.D. O'Donnell's")
  end
	def contact_form_email( contact )
		@contact = contact
    mail(:to => "sarah@sdodonnell.com", :subject => "Message from contact form")
  end
end
