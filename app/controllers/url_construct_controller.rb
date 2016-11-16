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


    if @yay == 5
      @forView = [2,3,4]
    end
   

    # array = [1,2,3]
    # source = HTTParty.get(@@base + "wef" )
    # data = JSON.parse((source.body))
    # badURL = HTTParty.get(@@base + "yousuck")
    # badJSON = JSON.parse((badURL.body))

    #  if (data == badJSON)
    #  else
    # data.each do |data|
 
    
    # display = data["value"]
    # array.push(display)

    # end
   
    # end


     @forView = [1,2,3]

  end




  # def url2016FallCourses


  

  #   array  = []


  #     urltesting = "2016"
  #     urlSemester(urltesting)
  #     instage_year_url = @@base + urltesting

      
  #       instage_season_url = instage_year_url + '/' + "fall"
  #       urlFaculty(instage_season_url)
        

  #        @FacultyView.each do |falculty|
  #           instage_falculty_url = instage_season_url + '/' + falculty.dSubject
  #           urlCourse(instage_falculty_url)
            
  #           @CourseView.each do |course|
  #             filler = instage_course_url = instage_falculty_url+ '/' + course.dCourseNumber



  #             creating_new_course = Course.new("faculty" => falculty.dSubject, "number" => course.dCourseNumber, "year" => "2016", "semester" => "fall", )
  #             creating_new_course.save


  #             array.push(filler)

  #           end

          
  #        end



  # @forView = array


  # end




 def url2015SpringCourses


  

    array  = []


      urltesting = "2015"
      urlSemester(urltesting)
      instage_year_url = @@base + urltesting

      
        instage_season_url = instage_year_url + '/' + "spring"
        urlFaculty(instage_season_url)
        

         @FacultyView.each do |falculty|
            instage_falculty_url = instage_season_url + '/' + falculty.dSubject
            urlCourse(instage_falculty_url)
            
            @CourseView.each do |course|
              instage_course_url = instage_falculty_url+ '/' + course.dCourseNumber
              urlSection(instage_course_url)

              @SectionView.each do |section|

                filler = instage_section_url = instage_course_url + '/' + section.dSectionNumber

                creating_new_course = Course.new("faculty" => falculty.dSubject, "number" => course.dCourseNumber, "year" => "2015", "semester" => "spring", "section" => section.dSectionNumber, "CourseUrl" => instage_section_url  )
                creating_new_course.save


                array.push(filler)
              end

            end

          
          end



  @forView = array


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

    badURL = HTTParty.get(@@base + "genjihasabrother")
    badJSON = JSON.parse((badURL.body))

    if (data == badJSON)
    else

      data.each do |display|
        subject = display["value"]
        dValue = DFaculty.new("dSubject" => subject)
        dValue.save
        array.push(dValue)
      end
    end

    @FacultyView = array
  end






  def urlCourse(instage_falculty_url)
    array = []
    nURL = instage_falculty_url
    source = HTTParty.get(nURL)
    data = JSON.parse((source.body))

    badURL = HTTParty.get(@@base + "genjihasabrother")
    badJSON = JSON.parse((badURL.body))

    if (data == badJSON)
    else
    

      data.each do |display|
          course = display["value"]
          dValue = DCourse.new("dCourseNumber" => course)
          dValue.save
          array.push(dValue)
      end

    end


    @CourseView = array
  end

end




def urlSection(instage_course_url)
  array = []
  nURL = instage_course_url
  source = HTTParty.get(nURL)
  data = JSON.parse((source.body))

  badURL = HTTParty.get("http://www.sfu.ca/bin/wcm/course-outlines?genjihasabrother")
  badJSON = JSON.parse((badURL.body))

  if (data == badJSON)
  else


    data.each do |display|
        section = display["value"]
        dValue = DSection.new("dSectionNumber" => section)
        dValue.save
        array.push(dValue)
    end

  end


  @SectionView = array



end
