class Runner < ActiveRecord::Base
  belongs_to :stage
  belongs_to :team
  belongs_to :runner_status_code
  
  def self.find_all_runners
    find(:all, :order => "stage_id")
  end
  
  def self.find_all_runners_for_team (team_id)
  end

end
