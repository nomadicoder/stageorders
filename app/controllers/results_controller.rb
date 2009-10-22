class ResultsController < ApplicationController
  def index
    @stages = Stage.find_all_stages
  end

end
