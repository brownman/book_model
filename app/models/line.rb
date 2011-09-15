class Line < ActiveRecord::Base


  acts_as_list :column => "pos", :scope => :parent

  default_scope order('pos ASC') #lazy!
belongs_to :page
#default_scope :order => 'microposts.created_at DESC'
#  acts_as_list :column => "pos"


end
