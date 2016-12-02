class ScheduleController < ApplicationController

  require 'json'
  require 'open-uri'
  require 'httparty'
  # The way ruby stores variables is quite wierd. suppose you went to p1 then p2,
  # then the arrays keep their info from p1 to p2 (or vise versa)
  # But when you do change the array (say, change sized to something else), then
  # the arrays become new arrays and are clean from info from p1 and p2



  def index
  end

  def p1
    #url = 'http://www.sfu.ca/bin/wcm/course-outlines?2016/fall/cmpt/106/d100'
    url = 'http://www.sfu.ca/bin/wcm/course-outlines?2016/fall/acma/210/d100'
    #url = 'http://www.sfu.ca/bin/wcm/course-outlines?2016/fall/arch/131/d100'
    try = HTTParty.get(url + 'fucking timeout')
    bad = {"errorMessage":"Invalid Query String or Object does not exist."}
    if try.include? "errorMessage"
      @display = "found the error"
    else
      @display = "no error"
    end

  end

  def p2
    clearingVariables
    generateTable
  end

  def p3
  end

  # populateWeek currently only works for 1 course.
  # To be considered if check statements should be done in populateWeek
  # or in separate function run outside of populateWeek.

end
# text_field_tag :faculty, params[:faculty]
