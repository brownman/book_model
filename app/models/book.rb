str = ''
#str=  File.dirname(__FILE__) + '/acts_as_restful_list'
#str  = File.dirname(__FILE__) + '../../vendor/plugins/lib/'
puts str
#require str
class Book < ActiveRecord::Base
#include ActsAsRestfulList 
#acts_as_restful_list
#acts_as_list

 #attr_accessor :title , :position , :parent_id
belongs_to :user
has_many :chapters , :dependent => :destroy
  validates :user_id, :presence => true

end
