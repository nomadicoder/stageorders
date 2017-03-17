class Runner < ActiveRecord::Base
  belongs_to :stage
  belongs_to :team
  belongs_to :runner_status_code
  has_one :stage_status
  
  validates_presence_of :name, :team
  #validate :pace_time_valid, :actual_time_valid
  
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
  
  def name_with_team
    name = self.name
    name << ' ('+ team.name + ')' if team
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

  def self.find_all_runners_for_team_and_stage(team, stage)
    find(:all, :joins => :stage, :conditions => "team_id = #{team.id} AND stage_id = #{stage.id}") unless (team.nil? || stage.nil?)
  end
  
  def estimated_pace_formatted
    self.estimated_pace.strftime("%M:%S") unless self.estimated_pace.nil?
  end
  
  def estimated_pace_formatted=(estimated_pace)
    # Preserve the actual time incase it is invalid
    @estimated_pace_check = estimated_pace
    if !/^\d+:\d+$/.match(estimated_pace).nil?
      # New Start
      estimated_pace += " UTC"
      # New End
      self.estimated_pace = Time.parse("00:"+estimated_pace)
    end
  end

  def actual_time_formatted
    self.actual_time.strftime("%H:%M:%S") unless self.estimated_pace.nil?

  end
  
  def actual_time_formatted=(actual_time)
    # Preserve the actual time incase it is invalid
    @actual_time_check = actual_time
    if !/^\d+:\d+:\d+$/.match(actual_time).nil?
      # New Start
      actual_time += " UTC"
      # New End
      self.actual_time = Time.parse(actual_time)
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |runner|
        csv << runner.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      runner = find_by_id(row["id"]) || new
      runner.attributes = row.to_hash.slice(*attributes)
      runner.save!
    end
  end  

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

protected
  def pace_time_valid
    # If the formatted time is invalid, display error message and highlight the field
    errors.add(:estimated_pace_formatted, "Format of Pace Time should be 'mm:ss'") if /^\d+:\d+$/.match(@estimated_pace_check).nil?
  end

  def actual_time_valid
    # If the formatted time is invalid, display error message and highlight the field
    errors.add(:actual_time_formatted, "Format of Actual Time should be 'hh:mm:ss'") if /^\d+:\d+:\d+$/.match(@actual_time_check).nil?
  end
end
