class Rating < ActiveRecord::Base
	 validates_length_of :prof_name, :maximum => 30
	 validates_length_of :prof_name, :minimum => 3
	 validates :user_name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }

	 validates :rating, numericality: { only_integer: true } 
end
