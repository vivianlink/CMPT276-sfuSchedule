class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def clearingVariables
    sized = Array.new(32, ['_'*9, false, -111, ''])
    @@mon = sized.dup
    @@tue = sized.dup
    @@wed = sized.dup
    @@thu = sized.dup
    @@fri = sized.dup
    @@sat = sized.dup
    @@sun = sized.dup
    @@dWeekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    @@warning = 'No time conflicts found.'
    @@warning2 = 'Successful schedule table built.'
    @@courseConflict = []
  end



  	def authenticate_user
  	if session[:user_id]
	     # set current user object to @current_user object variable
	    @current_user = User.find session[:user_id]
	    return true
	  else
	    redirect_to(:controller => 'sessions', :action => 'login')
	    return false
	  end
	end
	def save_login_state
	  if session[:user_id]
	    redirect_to(:controller => 'sessions', :action => 'home')
	    return false
	  else
	    return true
	  end
	end


# Schedule table code here
  def populateWeek(timeS, course, duration, days, id, type)

    duration = duration*2 -1
    timeS = ((timeToDecimal(timeS)-8)*2).round

    if course !=''
      if type=='course'
        name = (course.faculty).to_s.upcase + (course.number).to_s
      elsif type == 'tutorial'
        name = (course.tutname).to_s.upcase
      else
        name = 'Course'
      end
    else
      name = 'NoName'
    end

    if days.include? "Mo"
      for i in 0..duration
        if @@mon[timeS + i][1] == false
          @@mon[timeS + i] = [name, true, id, type]
        else
          errorMessageSchedule(1, name, @@mon[timeS + i][0])
        end
      end
    end
    if days.include? "Tu"
      for i in 0..duration
        if @@tue[timeS + i][1] == false
          @@tue[timeS + i] = [name, true, id, type]
        else
          errorMessageSchedule(1, name, @@tue[timeS + i][0])
        end
      end
    end
    if days.include? "We"
      for i in 0..duration
        if @@wed[timeS + i][1] == false
          @@wed[timeS + i] = [name, true, id, type]
        else
          errorMessageSchedule(1, name, @@wed[timeS + i][0])
        end
      end
    end
    if days.include? "Th"
      for i in 0..duration
        if @@thu[timeS + i][1] == false
          @@thu[timeS + i] = [name, true, id, type]
        else
          errorMessageSchedule(1, name, @@thu[timeS + i][0])
        end
      end
    end
    if days.include? "Fr"
      for i in 0..duration
        if @@fri[timeS + i][1] == false
          @@fri[timeS + i] = [name, true, id, type]
        else
          errorMessageSchedule(1, name, @@fri[timeS + i][0])
        end
      end
    end
    if days.include? "Sa"
      for i in 0..duration
        if @@sat[timeS + i][1] == false
          @@sat[timeS + i] = [name, true, id, type]
        else
          errorMessageSchedule(1, name, @@sat[timeS + i][0])
        end
      end
    end
    if days.include? "Su"
      for i in 0..duration
        if @@sun[timeS + i][1] == false
          @@sun[timeS + i] = [name, true, id, type]
        else
          errorMessageSchedule(1, name, @@sun[timeS + i][0])
        end
      end
    end
  end

  def timeToDecimal(time)
    timeI = 0
    temp = time.split(':')
    timeI = temp[0].to_f + temp[1].to_f/60
    return timeI
  end

  def generateTable
    user = User.find(session[:user_id])
    @dWeekdays = @@dWeekdays

    if user.course.any?
      user.course.each do |course|
        generateData(course, 'course')
      end
    end
    if user.tutorial.any?
      user.tutorial.each do |tutorial|
        generateData(tutorial, 'tutorial')
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
    @warning2 = @@warning2
  end

  def generateData(course, type)
    if type == 'course'
      url = course.CourseUrl
    elsif type == 'tutorial'
      url = course.TutUrl
    end
    id = course.id

    counter = 0
    for counter in 0..30
      try = HTTParty.get(url)
      schedule = JSON.parse(try.body)
      if schedule.include? 'courseSchedule'
        counter = 50
      else
        sleep 1
      end
      if counter == 25
        errorMessageSchedule(2, '', '')
      end
    end

    if counter !=25
      schedule = schedule['courseSchedule']
      schedule.each do |schedule|
        timeS, timeE, days = '','', ''
        if (schedule.include?("startTime"))
          timeS = schedule['startTime']
          timeE = schedule['endTime']
          days = (schedule['days'].tr(' ', '')).split(',')
          duration =  (timeToDecimal(timeE) - timeToDecimal(timeS)).ceil
          populateWeek(timeS, course, duration, days, id, type)
        end
      end
    end
  end



  def generateTableShow(course)
    @dWeekdays = @@dWeekdays

    url = course.CourseUrl
    id = course.id
    flag = false

    counter = 0
    for counter in 0..30
      try = HTTParty.get(url)
      schedule = JSON.parse(try.body)
      if schedule.include? 'courseSchedule'
        counter = 50
      else
        sleep 1
      end
      if counter == 25
        errorMessageSchedule(2, '', '')
      end
    end


    schedule = schedule['courseSchedule']
    schedule.each do |schedule|
      timeS, timeE, days = '','', ''
      if (schedule.include?("startTime"))
        timeS = schedule['startTime']
        timeE = schedule['endTime']
        days = (schedule['days'].tr(' ', '')).split(',')
        duration =  (timeToDecimal(timeE) - timeToDecimal(timeS)).ceil
        populateWeek(timeS, course, duration, days, id, 'course')
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
    @warning2 = @@warning2
  end



  def errorMessageSchedule(i, name0, name1)
    if i==1
      if !(@@courseConflict.include?(name0))
        @@courseConflict.push(name0)
      elsif !(@@courseConflict.include?(name1))
        @@courseConflict.push(name1)
      end
      temp = @@courseConflict.join(", ")
      @@warning = 'The following courses have time conflicts: ' + temp + '. Please make sure this is intended.'
    end
    if i==2
      @@warning2 = "Server timeout issue. Please refresh page. If error persists, please rerun application at later time"
    end
  end


end
