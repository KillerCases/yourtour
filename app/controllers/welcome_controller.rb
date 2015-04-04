class WelcomeController < ApplicationController
  def index
    @tours = Tour.all
  end

  def about
  end

  def contact
  end

  def faq
  end
end
