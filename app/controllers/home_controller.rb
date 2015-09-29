class HomeController < ApplicationController

  before_action :authenticate_user!

  def icefloe
  end
end
