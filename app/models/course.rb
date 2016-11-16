class Course < ActiveRecord::Base
	#belongs_to :faculty
validates :terms_of_service, :acceptance => true

  def self.search(faculty, number, year,semester, section, instructor)
    #return scoped unless faculty.present? || number.present?

    if faculty || number || year || semester || section || instructor
     
     where(['faculty LIKE ? AND number LIKE ? AND year LIKE ? AND semester LIKE ? AND section LIKE ? AND instructor LIKE ?', 
      "%#{faculty}%", "%#{number}%", "%#{year}%", "%#{semester}%", "%#{section}%", "%#{instructor}%"])
    
    else
      self.all
    end
  end
	 


end

