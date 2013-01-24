class MainMailer < ActionMailer::Base
  default from: "sarah@sdodonnell.com"

	def test_email( recipiant )
    mail(:to => recipiant, :subject => "Action Mailer is up and running ;)")
  end
end
