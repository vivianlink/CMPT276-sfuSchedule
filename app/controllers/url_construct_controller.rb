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


  




    array  = []
   

    urlYear


      urltesting = "2016"
      urlSemester(urltesting)
      instage_year_url = @@base + urltesting

      
        instage_season_url = instage_year_url + '/' + "fall"
        urlFaculty(instage_season_url)
        

         @FacultyView.each do |falculty|
            instage_falculty_url = instage_season_url + '/' + falculty.dSubject
            urlCourse(instage_falculty_url)
            
            @CourseView.each do |course|
              filler = instage_course_url = instage_falculty_url+ '/' + course.dCourseNumber



              creating_new_course = Course.new("faculty" => falculty.dSubject, "number" => course.dCourseNumber, "year" => "2016", "semester" => "fall")
              creating_new_course.save


              array.push(filler)

            end

          
         end














  

  @forView = array











=begin





  array = []

    urlYear

    instage_falculty_url = 'http://www.sfu.ca/bin/wcm/course-outlines?2014/fall/iat'

    filler = urlCourse(instage_falculty_url)
    array.push(filler)






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
        url = url + '/' + season.dSemesterSeasons
        @FacultyView.each do |faculty|
          filler = urlCourse(faculty.dSubject, url)
          array.push(filler)
        end
        array.push(filler)
      end
        #array.push(filler)
    end



    @forView = array

    #@data =JSON.parse(HTTParty.get('http://www.sfu.ca/bin/wcm/course-outlines?2017/spring').body)
=end
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





  def urlFaculty(instage_semester_url)
    array = []
    nURL = instage_semester_url
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






  def urlCourse(instage_falculty_url)
    array = []
    nURL = instage_falculty_url
    source = HTTParty.get(nURL)
    data = JSON.parse((source.body))

    data.each do |display|
      course = display["value"]
      dValue = DCourse.new("dCourseNumber" => course)
      dValue.save
      array.push(dValue)
    end
    @CourseView = array
  end

end
