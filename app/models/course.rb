class Course < ActiveRecord::Base
  has_and_belongs_to_many :user

  def self.search(faculty, number, year,semester, unit, designation)

    if faculty || number || year || semester || unit || designation #|| section || instructor || unit

     where(['faculty LIKE ? AND number LIKE ? AND year LIKE ? AND semester LIKE ? AND unit LIKE ? AND designation LIKE ?',
      "%#{faculty}%", "%#{number}%", "%#{year}%", "%#{semester}%", "%#{unit}%" ,"%#{designation}%"  ]) #, "%#{unit}%", "%#{designation}%"  ])
    else
      self.all
    end
  end


end
