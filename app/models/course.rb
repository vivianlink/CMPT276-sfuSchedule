class Course < ActiveRecord::Base
	#belongs_to :faculty
validates :terms_of_service, :acceptance => true

  def self.search(faculty, number, year,semester, section, instructor, unit, designation)
    #return scoped unless faculty.present? || number.present?

    if faculty || number || year || semester || section || instructor || unit
     
     where(['faculty LIKE ? AND number LIKE ? AND year LIKE ? AND semester LIKE ? AND section LIKE ? AND instructor LIKE ? AND unit LIKE ? AND designation LIKE ?', 
      "%#{faculty}%", "%#{number}%", "%#{year}%", "%#{semester}%", "%#{section}%", "%#{instructor}%", "%#{unit}%", "%#{designation}"])
    
    else
      self.all
    end
  end
	 


end

