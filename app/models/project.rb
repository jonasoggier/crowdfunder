class Project < ActiveRecord::Base
  belongs_to :user
  has_many :pledges, :dependent => :destroy
  has_many :images, dependent: :destroy

  attr_accessible :description, :goal, :teaser, :title

  validates :title, :teaser, :description, :presence => true
  validates :goal, :numericality => { :only_integer => true, greater_than: 0 }

  scope :latest, order('created_at DESC')

end
