class Page < ActiveRecord::Base
belongs_to :compare
has_many :lines , :dependent => :destroy
end
