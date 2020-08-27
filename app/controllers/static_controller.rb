class StaticController < ApplicationController
  def home
    render layout: "landing_layout"
  end
end
