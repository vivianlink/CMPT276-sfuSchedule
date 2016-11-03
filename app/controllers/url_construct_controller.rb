class UrlConstructController < ApplicationController
  require 'json'
  require 'open-uri'
  require 'httparty'



  @@base = 'http://www.sfu.ca/bin/wcm/course-outlines?'

  def index
  #  @forView = $forView
    array = []
    

    urlYear

    @YearView.each do |year|
        filler = urlSemester(year.dYearNumber)
        array.push(filler)
    end  



    @forView = array



  end


  def urlYear
    array = []
    source = HTTParty.get(@@base)
    data = JSON.parse((source.body))


=begin

    data.each do |display|
      id = display["value"]
      course_url = id
      array.push(course_url)
    end

=end

    data.each do |display|
      id = display["value"]
      @dsomething = DYear.new("dYearNumber" => id)
      @dsomething.save
      array.push(@dsomething)
    end

  @YearView = array

  end

  def urlSemester(year)
    array = []
    source = HTTParty.get(@@base + year)
    data = JSON.parse((source.body))

     data.each do |display|
      id = display["value"]
      @dsomething = DSemester.new("dSemesterSeasons" => id)
      @dsomething.save
      array.push(@dsomething)
    end
  @SemesterView = array




  end
















end
