class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :role)}
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def client
    FooClient.instance
  end
end

class FooClient < ZendeskAPI::Client
  def self.instance
    @instance ||= new do |config|
      config.url = ENV['ZD_URL']
      config.username = ENV['ZD_USER']
      config.password = ENV['ZD_PASS']
      config.retry = true
      config.logger = Rails.logger
    end
  end

  def tickets(email)
    search(:query => "requester:#{email}")
  end
  
end
