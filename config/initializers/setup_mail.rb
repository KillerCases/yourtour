ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address               => 'smtp.sendgrid.net',
  :port                  => '587',
  :authentication        => :plain,
  :username              => 'app33331379@heroku.com',
  :password              => 'uwnvlawr ',
  :domain                => 'heroku.com',
   #   Domain will need to be changed when using custom domain
  :enable_starttls_auto  => true
  }