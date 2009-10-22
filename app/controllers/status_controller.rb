class StatusController < ApplicationController
  def index
    @stages = Stage.find_all_stages
  end

  def update
  end

end
