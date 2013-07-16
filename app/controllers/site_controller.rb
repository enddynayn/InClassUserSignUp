class SiteController < ApplicationController
	before_action :is_authenticated, only: [:index]
  
  def index
  end

  def privacy
  	@something = 'Yo Papa!'
  end

  def terms
  end
end
