class UrlConstructController < ApplicationController
  # This class file has all the methods required to construct the url's
  # and parse the json files into the database models.
  # All other models should be able to refer to the database models
  # instead of the sfu api.
  require 'json'
  require 'open-uri'
  require 'httparty'

  @@base = 'http://www.sfu.ca/bin/wcm/course-outlines?'

  def index
    # Test method for output results.
    #@forView = $forView
    array = []

    urlYear

    # Methods do not loop like this, thus we must have a separate function
    # Or loop to iterate per element.

    @YearView.each do |year|
      #urlSemester(year.dYearNumber)
      #url = @@base + year.dYearNumber
      urlSemester('2014')
      url = @@base + '2014'
      @SemesterView.each do |season|
        filler = urlFaculty(season.dSemesterSeasons, url)
        #url = url + '/' + season.dSemesterSeasons
        # @FacultyView.each do |faculty|
        #   filler = urlCourse(faculty.dSubject, url)
        #   array.push(filler)
        # end
        array.push(filler)
      end
        #array.push(filler)
    end



    @forView = array

    #@data =JSON.parse(HTTParty.get('http://www.sfu.ca/bin/wcm/course-outlines?2017/spring').body)
  end

  def urlYear
    array = []
    source = HTTParty.get(@@base)
    data = JSON.parse((source.body))

    data.each do |display|
      id = display["value"]
      dsomething = DYear.new("dYearNumber" => id)
      dsomething.save
      array.push(dsomething)
    end
    @YearView = array
  end

  def urlSemester(year)
    array = []
    url = @@base + year
    source = HTTParty.get(url)
    data = JSON.parse((source.body))

    data.each do |display|
      id = display["value"]
      dsomething = DSemester.new("dSemesterSeasons" => id)
      dsomething.save
      array.push(dsomething)
    end
    @SemesterView = array
  end

  def urlFaculty(semester, url)
    array = []
    nURL = url + '/' + semester
    source = HTTParty.get(nURL)
    data = JSON.parse((source.body))

    data.each do |display|
      subject = display["value"]
      dValue = DFaculty.new("dSubject" => subject)
      dValue.save
      array.push(dValue)
    end
    @FacultyView = array
  end

  def urlCourse(faculty, url)
    array = []
    nURL = url + '/' + faculty
    source = HTTParty.get(nURL)
    data = JSON.parse((source.body))

    data.each do |display|
      course = display["value"]
      #title = display["title"]
      #dValue = DCourse.new("dCourseNumber" => course, "dTitle" => title)
      dValue = DCourse.new("dCourseNumber" => course)
      dValue.save
      array.push(dValue)
    end
    @CourseView = array
  end

end
