# Action Mailer
ActionMailer::Base.smtp_settings = {
	:address              => "smtp.gmail.com",
	:tls                  => true,
	:port                 => 587,
	:user_name            => 'tyrelrichey@gmail.com',
	:password             => 'GA_BuddhA024878',
	:authentication       => 'plain',
	:enable_starttls_auto => true 
}
