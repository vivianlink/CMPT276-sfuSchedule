class Course < ActiveRecord::Base
	#belongs_to :faculty
validates :terms_of_service, :acceptance => true

  def self.search(faculty, number, year,semester)
    #return scoped unless faculty.present? || number.present?

    if faculty || number || year || semester
     
     where(['faculty LIKE ? AND number LIKE ? AND year LIKE ? AND semester LIKE ?', 
      "%#{faculty}%", "%#{number}%", "%#{year}%", "%#{semester}%"])
    
    else
      self.all
    end
  end
	 


end

