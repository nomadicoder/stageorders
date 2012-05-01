class Team < ActiveRecord::Base
  attr_accessible :name, :number, :short_name, :start_time
  has_many :runners
  has_many :support_units
  has_many :stage_status
  has_many :blogs

  def self.find_by_short_code(short_code)
    find(:first, :conditions => "short_name = '#{short_code}'")
  end
  
  def init_time
     @total_minutes = 0.0 
     @total_estimated_minutes = 0.0 
     @total_off_pace = 0.0 
     @time_zero = 946684800 
     @stage_start = self.start_time 
  end
  
  def stage_time(distance, pace)
    stage_time = distance * (pace.min + pace.sec/60.0)
  end

  def time_to_minutes(time)
    time_to_minutes = time.hour*60 + time.min + time.sec/60.0
  end

  def update_time (runner)
    @estimated_minutes = stage_time(runner.stage.miles, runner.estimated_pace)
    @total_estimated_minutes +=  @estimated_minutes
    if runner.actual_time.to_i != @time_zero
      @actual_minutes = time_to_minutes(runner.actual_time)
      @total_minutes +=  @actual_minutes
      @off_pace = @actual_minutes - @estimated_minutes
      @total_off_pace += @off_pace
    end
  end

end
