class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_accessible :amount, :project_id, :user_id

  validates :amount, :presence => true
  validates :amount, :numericality => { :only_integer => true }

end
