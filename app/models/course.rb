class Course < ActiveRecord::Base
  has_and_belongs_to_many :user
  has_many :tutorial

  def self.search(faculty, number, year,semester, unit, w,q,b, mon, tu, wed, th, fri)

    if faculty || number || year || semester || unit || w || q || b || mon || tu || wed || th || fri #|| section || instructor || unit

     where(['faculty LIKE ? AND number LIKE ? AND year LIKE ? AND semester LIKE ? AND unit LIKE ? AND designation LIKE ?  AND designation LIKE ?  AND designation LIKE ?  AND calender LIKE ?  AND calender LIKE ?  AND calender LIKE ?  AND calender LIKE ?  AND calender LIKE ?',
      "%#{faculty}%", "%#{number}%", "%#{year}%", "%#{semester}%", "%#{unit}%" ,"%#{w}%" ,"%#{q}%","%#{b}%","%#{mon}%","%#{tu}%","%#{wed}%","%#{th}%","%#{fri}%" ]) #, "%#{unit}%", "%#{designation}%"  ])
    else
      self.all
    end
  end


end
