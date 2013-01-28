# Action Mailer
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address              => "smtp.live.com",
	:port                 => 587,
	:user_name            => 'sarah@sdodonnell.com',
	:password             => 'wolf55',
	:authentication       => :plain,
	:enable_starttls_auto => true
}
