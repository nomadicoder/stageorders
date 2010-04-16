class Results
  def initialize (team)
    @total_minutes = 0.0 
    @total_estimated_minutes = 0.0 
    @total_off_pace = 0.0 
    @time_zero = 946684800 

    @team = team
    @stage_start = @team.start_time 
    @stage_finish = @stage_start
  end
  
  # Virtual Attributes
  def time_zero
    @time_zero
  end
  
  def total_minutes
    @total_minutes
  end
  
  def total_estimated_minutes
    @total_estimated_minutes
  end
  
  def total_off_pace
    @total_off_pace
  end
  
  def off_pace
    @off_pace
  end
  
  def stage_start
    @stage_start
  end
  
  def stage_finish
    @stage_finish
  end
  
  def estimated_minutes
    @estimated_minutes
  end
  
  def time_to_minutes(time)
    time_to_minutes = time.hour*60 + time.min + time.sec/60.0
  end
  
  # Update stage statistics
  def calculate_stage_results (runner)
    @stage_start = @stage_finish
    @estimated_minutes = runner.stage.miles * (runner.estimated_pace.min + runner.estimated_pace.sec/60.0)
    @total_estimated_minutes = @total_estimated_minutes + @estimated_minutes
    
    if runner.actual_time.to_i != @time_zero
      @actual_minutes = time_to_minutes(runner.actual_time)
      @total_minutes = @total_minutes + @actual_minutes
      @off_pace = @actual_minutes - @estimated_minutes
      @total_off_pace = total_off_pace + @off_pace
    end
    
    if runner.actual_time.to_i != @time_zero
        @stage_time = time_to_minutes(runner.actual_time)
    else
        @stage_time = @estimated_minutes
    end
    @stage_finish += (60 * @stage_time)
  end
end