class DSemester < ActiveRecord::Base
  belongs_to :DYear
  has_many :DFaculties
end
