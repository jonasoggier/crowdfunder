class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  has_many :projects
  has_many :pledges

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :on => :create
end
