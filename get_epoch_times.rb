class GetEpochTimes

  def initialize
    @current_time = Time.now
  end

  def the_start_time
    Time.local(@current_time.year,@current_time.month,@current_time.day,8,0,0).to_i
  end

  def the_end_time
    Time.local(@current_time.year,@current_time.month,@current_time.day,20,0,0).to_i
  end
end
