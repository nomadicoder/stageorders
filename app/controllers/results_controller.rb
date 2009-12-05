class ResultsController < ApplicationController
  def index
    @runners = Runner.find_all_runners
  end

  def authorize
  end

end
