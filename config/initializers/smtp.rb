Rails.application.config.action_mailer.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => 'lithasa.email',
  :password             => 'lithasa123',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }