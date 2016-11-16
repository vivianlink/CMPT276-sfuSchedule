class Course < ActiveRecord::Base
	#belongs_to :faculty
validates :terms_of_service, :acceptance => true

  def self.search(faculty, number, year,semester, section)
    #return scoped unless faculty.present? || number.present?

    if faculty || number || year || semester || section
     
     where(['faculty LIKE ? AND number LIKE ? AND year LIKE ? AND semester LIKE ? AND section LIKE ?', 
      "%#{faculty}%", "%#{number}%", "%#{year}%", "%#{semester}%", "%#{section}%"])
    
    else
      self.all
    end
  end
	 


end

