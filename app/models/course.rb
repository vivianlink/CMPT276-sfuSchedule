class Course < ActiveRecord::Base
	#belongs_to :faculty

  def self.search(search)
    if search
     self.where("name like ?", "%#{search}%")
    else
      self.all
    end
  end
	 


end
