Rails.application.config.middleware.use ExceptionNotification::Rack,
  :ignore_crawlers => %w{Googlebot bingbot},
  :email => {
    :email_prefix => "[Facebook Analyzer Exception Notifier] ",
    :sender_address => %{"notifier" <notifier@kaka.com>},
    :exception_recipients => %w{cuongnm17290@gmail.com}
  }