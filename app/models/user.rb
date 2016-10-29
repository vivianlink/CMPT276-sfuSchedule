class User < ActiveRecord::Base
  attr_accessor :password
  EMAIL_REGEX =  /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
end