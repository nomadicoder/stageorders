class StageStatus < ActiveRecord::Base
  belongs_to :stage
  belongs_to :team
  belongs_to :runner
  belongs_to :support_unit
  belongs_to :runner_status_code
  belongs_to :support_status_code
  belongs_to :stage_status_code
  
  def stage_number
    stage.number if stage
  end
  
  def stage_number=(number)
    self.team = Stage.find_by_number(number) unless number.blank?
  end

  def team_name
    team.name if team
  end
  
  def team_name=(name)
    self.team = Team.find_by_name(name) unless name.blank?
  end
  
  def team_short_name
    team.short_name if team
  end
  
  def team_short_name=(short_name)
    self.team = Team.find_by_short_name(short_name) unless short_name.blank?
  end
  
  def runner_name
    runner.name if runner
  end
  
  def runner_name=(name)
    self.runner = Runner.find_by_name(name) unless name.blank?
  end
  
  def tac_callsign
    support_unit.tac_callsign if support_unit
  end
  
  def tac_callsign=(tac_callsign)
    self.tac_callsign = SupportUnit.find_by_tac_callsign(tac_callsign) unless tac_callsign.blank?
  end
  
  def runner_status
    runner_status_code.short_code if runner_status_code
  end
  
  def runner_status=(short_code)
    self.runner_status_code = RunnerStatusCode.find_by_short_code(short_code) unless short_code.blank?
  end
  
  def support_status
    support_status_code.short_code if support_status_code
  end
  
  def support_status=(short_code)
    self.support_short_code = SupportStatusCode.find_by_short_code(short_code) unless short_code.blank?
  end
  
  def stage_status
    stage_status_code.short_code if stage_status_code
  end
  
  def stage_status=(short_code)
    self.stage_short_code = StageStatusCode.find_by_short_code(short_code) unless short_code.blank?
  end
  
  def update_status
    self.stage_status = StageStatusCode.get_state(runner_status_code.short_code, support_status_code.short_code)
  end

  # orders all of the stages by stage number
  def self.find_all_stage_statuses
    find(:all, :joins => :stage, :order => "stages.number")
  end
end
