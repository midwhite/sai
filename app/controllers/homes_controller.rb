class HomesController < ApplicationController
  def index
    template = user_signed_in? ? "index" : "welcome"
    render "homes/" + template
  end
end
