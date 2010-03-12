class Runner < ActiveRecord::Base
  belongs_to :stage
  belongs_to :team
  belongs_to :runner_status_code
  has_one :stage_status
  
  #validates_format_of :estimated_pace, :with => /\d+:\d+/
  
  def runner_status
    runner_status_code.short_code if runner_status_code
  end
  
  def runner_status=(runner_status)
    self.runner_status_code = RunnerStatusCode.find_by_short_code(runner_status) unless runner_status.blank?
  end
  
  def update_stage_status
    # extract the runner's stage
    stage_number = stage.number
    team_name = team.name
    # get stage_status for the runner's stage
    stage_status = StageStatus.find(:first, :joins => [:stage, :team], :conditions => "stages.number = '#{stage.number}' AND teams.name = '#{team.name}'")
    stage_status.update_attributes(:runner_status_code => self.runner_status_code)
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
  
  def self.find_all_runners_for_team_code(team_code)
    team = find_all_runners_for_team(Team.find_by_short_code(team_code))
  end
  
  def self.find_all_runners_for_team(team)
    find(:all, :joins => :stage, :conditions => "team_id = #{team.id}", :order => "stages.number") unless team.nil?
  end
  
  def estimated_pace_formatted
    self.estimated_pace.strftime("%M:%S")
  end
  
  def estimated_pace_formatted=(estimated_pace)
    self.estimated_pace = Time.parse("00:"+estimated_pace)
  end

  def actual_time_formatted
    self.actual_time.strftime("%H:%M:%S")
  end
  
  def actual_time_formatted=(actual_time)
    self.actual_time = Time.parse(actual_time)
  end

end
