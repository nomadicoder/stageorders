module ResultsHelper
  def show_short_time(time)
    time.strftime("%H:%M:%S")
  end

  def show_local_time(time)
    time.strftime("%H:%M")
    #period_for_local(time, dst=true)
  end
  
  def minutes_as_short_time(time)
    hours = '%02d' % (time / 60).truncate
    minutes = '%02d' % (time % 60)
    seconds = '%02d' % (60*(time - time.truncate)).round
    minutes_as_short_time = hours + ':'+ minutes + ':' + seconds
  end

  def minutes_as_color_time(time)
    time_str = minutes_as_short_time(time)
    content_tag(:b, content_tag(:div, time_str, style: "color: #{time_style(time)}"))
  end

  def minutes_to_time(minutes)
    decimal_hours = '%d' % (minutes.truncate/60.0).truncate
    decimal_minutes = '%02d' % (minutes.truncate % 60)
    decimal_seconds =  '%02d' % (60*(minutes - minutes.truncate)).round
    time_string = decimal_hours + ':' + decimal_minutes + ':' + decimal_seconds
    minutes_to_time = Time.parse(time_string)
  end
  
  def signed_minutes_to_time(minutes)
    sign = (minutes < 0) ? '-' : ''
    signed_minutes_to_time = sign + minutes_as_short_time(minutes.abs)
  end
  
  def color_minutes_to_time(minutes)
    content_tag(:b, content_tag(:div, minutes_as_short_time(minutes.abs), style: "color: #{time_style(minutes)}"))
  end
  
  def time_style(time)
    if (time.floor < 0)
      color = "green"
    elsif (time.floor > 0)
      color = "red"
    elsif
      color = "none"
    end
  end
  
  def time_to_minutes(time)
    time_to_minutes = time.hour*60 + time.min + time.sec/60.0
  end
  
  def show_differential_time(time1, time2)
    minutes = (time_to_minutes(time1) - time_to_minutes(time2)).abs
    sign = (time_to_minutes(time1) > time_to_minutes(time2)) ? '-' : ''
    decimal_hours = '%d' % (minutes.truncate/60.0).truncate
    decimal_minutes = '%02d' % (minutes.truncate % 60).abs
    decimal_seconds =  '%02d' % (60*(minutes - minutes.truncate)).round.abs
    differential_time = sign + show_short_time(minutes_to_time((time_to_minutes(time1) - time_to_minutes(time2)).abs))
  end
  
  def stage_time(distance, pace)
    stage_time = distance * (pace.min + pace.sec/60.0)
  end
end
