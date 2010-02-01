class StatusController < ApplicationController
  def index
    stage_collection = Stage.find_all_stages
    @runners = Runner.find_all_runners
    @stages = stage_collection
  end

  def update
  end

end
