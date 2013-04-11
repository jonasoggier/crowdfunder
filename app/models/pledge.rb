class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_accessible :amount

  validates :amount, :presence => true
  validates :amount, :numericality => { :only_integer => true }

end
