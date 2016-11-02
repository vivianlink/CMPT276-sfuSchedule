class UrlConstructController < ApplicationController
  require 'json'
  require 'open-uri'
  require 'httparty'

  def index
    source = HTTParty.get('http://www.sfu.ca/bin/wcm/course-outlines?2014/fall/cmpt/102/d100')
    @data = JSON.parse((source.body))
  end
end
