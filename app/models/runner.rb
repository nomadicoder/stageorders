class Runner < ActiveRecord::Base
  belongs_to :stage
  belongs_to :team
  belongs_to :runner_status_code
  
  def runner_status
    runner_status_code.short_code if runner_status_code
  end
  
  def runner_status=(runner_status)
    self.runner_status_code = RunnerStatusCode.find_by_short_code(runner_status) unless runner_status.blank?
  end
  
  def stage_number
    stage.number if stage
  end
  
  def stage_number=(number)
    self.stage = Stage.find_by_number(number) unless number.blank?
  end
  
  def self.find_all_runners
    find(:all, :joins => :stage, :order => "stages.number")
  end
  
  def self.find_all_runners_for_team (team_id)
  end

end
