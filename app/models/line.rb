class Line < ActiveRecord::Base


  acts_as_list :column => "pos", :scope => :parent

belongs_to :page
end
