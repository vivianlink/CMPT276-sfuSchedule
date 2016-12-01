class ScheduleController < ApplicationController

  require 'json'
  require 'open-uri'
  require 'httparty'
  # The way ruby stores variables is quite wierd. suppose you went to p1 then p2,
  # then the arrays keep their info from p1 to p2 (or vise versa)
  # But when you do change the array (say, change sized to something else), then
  # the arrays become new arrays and are clean from info from p1 and p2
  sized = Array.new(32, ['_'*12, false])
  @@mon = sized.dup
  @@tue = sized.dup
  @@wed = sized.dup
  @@thu = sized.dup
  @@fri = sized.dup
  @@sat = sized.dup
  @@sun = sized.dup
  @@dWeekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  @@warning = 'Successful Schedule Table building :D'


  def index
  end

  def p1
    #url = 'http://www.sfu.ca/bin/wcm/course-outlines?2016/fall/cmpt/106/d100'
    url = 'http://www.sfu.ca/bin/wcm/course-outlines?2016/fall/acma/210/d100'
    #url = 'http://www.sfu.ca/bin/wcm/course-outlines?2016/fall/arch/131/d100'
    try = HTTParty.get(url)
    bad = {"errorMessage":"Invalid Query String or Object does not exist."}

    @dWeekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

    @display = 'No server timeout :D'
    for i in 0..10
      course = JSON.parse(try.body)
      if course.include?("errorMessage")
        @display = 'There was a server timeout DDDDDDDDDD:'
        #sleep 3
      else
        i = 15
      end
    end

    if @display != 'There was a server timeout DDDDDDDDDD:'

      schedule = course['courseSchedule']
      @display0 = schedule
      @display1 = schedule[0]['startTime']
      @display2 = timeToDecimal(@display1)
      @display3 = schedule[0]['endTime']
      @display4 = timeToDecimal(@display3)
      @display5 = (@display4 - @display2).ceil
      @display6 = schedule[0]['days']
      @display7 = (@display6.tr(' ', '')).split(',')


      schedule.each do |schedule|
        timeS, timeE, days = '','', ''
        if (schedule.include?("startTime"))
          timeS = schedule['startTime']
          timeE = schedule['endTime']
          days = (schedule['days'].tr(' ', '')).split(',')
          duration =  (timeToDecimal(timeE) - timeToDecimal(timeS)).ceil
          populateWeek(timeS, '', duration, days)
        end
      end
      @mon = @@mon
      @tue = @@tue
      @wed = @@wed
      @thu = @@thu
      @fri = @@fri
      @sat = @@sat
      @sun = @@sun
    end

    h = 8
    m = 0
    @timeSlot = Array.new(32, '')
    for i in 0..31
      @timeSlot[i] = h.to_s + ':' + m.to_s + '0'
      if m == 0
        m += 3
      elsif m == 3
        m = 0
        h += 1
      end
    end


  end

  def p2

    sized = Array.new(32, ['_'*12, false])
    @@mon = sized.dup
    @@tue = sized.dup
    @@wed = sized.dup
    @@thu = sized.dup
    @@fri = sized.dup
    @@sat = sized.dup
    @@sun = sized.dup


    user = User.find(session[:user_id])
    @dWeekdays = @@dWeekdays

    if user.course.any?
      user.course.each do |course|
        url = course.CourseUrl
        try = HTTParty.get(url)
        schedule = JSON.parse(try.body)
        schedule = schedule['courseSchedule']

        schedule.each do |schedule|
          timeS, timeE, days = '','', ''
          if (schedule.include?("startTime"))
            timeS = schedule['startTime']
            timeE = schedule['endTime']
            days = (schedule['days'].tr(' ', '')).split(',')
            duration =  (timeToDecimal(timeE) - timeToDecimal(timeS)).ceil
            populateWeek(timeS, course, duration, days)
          end
        end
      end
    end
    @mon = @@mon
    @tue = @@tue
    @wed = @@wed
    @thu = @@thu
    @fri = @@fri
    @sat = @@sat
    @sun = @@sun

    h = 8
    m = 0
    @timeSlot = Array.new(32, '')
    for i in 0..31
      @timeSlot[i] = h.to_s + ':' + m.to_s + '0'
      if m == 0
        m += 3
      elsif m == 3
        m = 0
        h += 1
      end
    end

    @warning = @@warning

  end

  def p3
  end

  def timeToDecimal(time)
    timeI = 0
    temp = time.split(':')
    timeI = temp[0].to_f + temp[1].to_f/60
    return timeI
  end

  # populateWeek currently only works for 1 course.
  # To be considered if check statements should be done in populateWeek
  # or in separate function run outside of populateWeek.

  def errorMessage(i)
    if i==1
      @@warning = 'There were course conflicts. Please check your courses.'
    end
  end

end
# text_field_tag :faculty, params[:faculty]
