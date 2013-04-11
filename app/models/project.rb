class Project < ActiveRecord::Base
  belongs_to :user
  has_many :pledges, :dependent => :destroy

  attr_accessible :description, :goal, :teaser, :title

  validates :title, :teaser, :description, :presence => true
  validates :goal, :numericality => { :only_integer => true }

end
