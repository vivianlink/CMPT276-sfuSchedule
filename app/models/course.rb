class Course < ActiveRecord::Base
	#belongs_to :faculty
validates :terms_of_service, :acceptance => true

  def self.search(search1,search2)
  	#return scoped unless faculty.present? || number.present?

    if search1 || search2
     #self.where("faculty like ? AND number like?", "%#{search}%","%#{search}%")
     where(['faculty LIKE ? AND number LIKE ?', "%#{search1}%", "%#{search2}%"])
     #self.where("number like ?", "%#{search}%")
    else
      self.all
    end
  end
	 


end
