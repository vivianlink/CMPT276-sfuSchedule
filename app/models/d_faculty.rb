class DFaculty < ActiveRecord::Base
  belongs_to :DSemester
  has_many :DCourses
end
