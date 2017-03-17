class Team < ActiveRecord::Base
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

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |team|
        csv << team.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      team = find_by_id(row["id"]) || new
      team.attributes = row.to_hash.slice(*attribute_names)
      team.save!
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

end
