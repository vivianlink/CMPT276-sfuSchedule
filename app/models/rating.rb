class Rating < ActiveRecord::Base
	 validates_length_of :prof_name, :in => 3..20
	 validates :user_name, :presence => true, :length => { :in => 3..20 }

	 validates :rating, numericality: { only_integer: true, allow_blank: true} 
end
