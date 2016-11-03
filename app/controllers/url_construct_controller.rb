class UrlConstructController < ApplicationController
  require 'json'
  require 'open-uri'
  require 'httparty'



  @@base = 'http://www.sfu.ca/bin/wcm/course-outlines?'

  def index
  #  @forView = $forView
    urlYear


    #source = HTTParty.get('http://www.sfu.ca/bin/wcm/course-outlines?2014/fall/cmpt/102/d100')
    #@forView = JSON.parse((source.body))
  end


  def urlYear
    @array = []
    source = HTTParty.get(@@base)
    @data = JSON.parse((source.body))

=begin
    @data.each do |display|
      id = display["value"]
      course_url = id
      @array.push(course_url)
    end
=end
    @data.each do |display|
      id = display["value"]
      dsomething = dYear.new("dYearNumber" => id)

    end



  end
end
