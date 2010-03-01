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
  
  def team_name
    team.name if team
  end
  
  def team_name=(name)
    self.team = Team.find_by_name(name) unless name.blank?
  end
  
  def self.find_all_runners
    find(:all, :joins => :stage, :order => "stages.number")
  end
  
  def self.find_all_runners_for_team (team_id)
  end
  
  def estimated_pace_formatted
    self.estimated_pace.strftime("%M:%S")
  end
  
  def estimated_pace_formatted=(estimated_pace)
    self.estimated_pace = Time.parse("00"+estimated_pace)
  end

  def actual_time_formatted
    self.actual_time.strftime("%H:%M:%S")
  end
  
  def actual_time_formatted=(actual_time)
    self.actual_time = Time.parse(actual_time)
  end

end
